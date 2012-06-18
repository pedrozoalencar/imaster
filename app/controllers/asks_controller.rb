class AsksController < ApplicationController
  
  
  rescue_from Exceptions::IsNotAuthorError, :with => :user_is_not_author
  before_filter :authenticate_user!
  
  # GET /asks
  # GET /asks.json
  def index
    @asks = Ask.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @asks }
    end
  end

  # GET /asks/1
  # GET /asks/1.json
  def show
    @ask = Ask.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ask }
    end
  end

  # GET /asks/new
  # GET /asks/new.json
  def new
    @ask = Ask.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ask }
    end
  end

  # GET /asks/1/edit
  def edit
    @ask = Ask.find(params[:id])
  end

  # POST /asks
  # POST /asks.json
  def create
    @ask = Ask.new(params[:ask])

    respond_to do |format|
      
      if @ask.save
        
        #Transitions of workflow
        case params[:submit_type]
        when 'draft'
          @ask.save_as_draft!
        else
          @ask.submit!
        end

        #Adding author role
        current_user.add_role :author, @ask
		        
        format.html { redirect_to @ask, notice: t('ask.successfully_save') }
        format.json { render json: @ask, status: :created, location: @ask }
      else
        format.html { render action: "new" }
        format.json { render json: @ask.errors, status: :unprocessable_entity }
      end
    
    end
  end

  # PUT /asks/1
  # PUT /asks/1.json
  def update
    @ask = Ask.find(params[:id])
    
    raise Exceptions::IsNotAuthorError unless current_user.has_role? :author, @ask
      
    #Transitions of workflow
    case params[:submit_type]
    when 'draft'
      @ask.save_as_draft!
    else
      @ask.submit!
    end

    respond_to do |format|
      raise Exceptions::IsNotAuthorError unless current_user.has_role? :author, @ask 
      
      if @ask.update_attributes(params[:ask])
        format.html { redirect_to @ask, notice: t('ask.successfully_update') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ask.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asks/1
  # DELETE /asks/1.json
  def destroy
    @ask = Ask.find(params[:id])
    
    raise Exceptions::IsNotAuthorError unless current_user.has_role? :author, @ask
    
    @ask.destroy

    respond_to do |format|
      format.html { redirect_to asks_url }
      format.json { head :no_content }
    end
  end
  
  def user_is_not_author
    respond_to do |format|
      format.html { redirect_to asks_url, notice: t('ask.not_author_error') }
      format.json { head :no_content, status: :access_denied }
    end
  end
end
