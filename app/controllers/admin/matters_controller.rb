class Admin::MattersController < ApplicationController
  rescue_from ActiveRecord::DeleteRestrictionError, :with => :user_is_not_author
  before_filter :authenticate_user!
  

  # GET /matters
  # GET /matters.json
  def index
    @matters = Matter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @matters }
    end
  end

  # GET /matters/matter_father/1
  def search
    if (params[:matter_fathers] == "true")
      @matters = Matter.where("matter_father_id is null")
    elsif params[:matter_father_id]
      @matters = Matter.find_by_matter_father_id(params[:matter_father_id])  
    end  

    
    
    respond_to do |format|
      format.json { render json: @matters }
    end
  end

  # GET /matters/1
  # GET /matters/1.json
  def show
    @matter = Matter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @matter }
    end
  end

  # GET /matters/new
  # GET /matters/new.json
  def new
    @matter = Matter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @matter }
    end
  end

  # GET /matters/1/edit
  def edit
    @matter = Matter.find(params[:id])
  end

  # POST /matters
  # POST /matters.json
  def create
    @matter = Matter.new(params[:matter])

    respond_to do |format|
      
      if @matter.save
        
        #Transitions of workflow
        case params[:submit_type]
        when 'draft'
          @matter.save_as_draft!
        else
          @matter.submit!
        end

        #Adding author role
        current_user.add_role :author, @matter
            
        format.html { redirect_to admin_matter_url(@matter), notice: t('matter.successfully_save') }
        format.json { render json: @matter, status: :created, location: @matter }
      else
        format.html { render action: "new" }
        format.json { render json: @matter.errors, status: :unprocessable_entity }
      end
    
    end
  end

  # PUT /matters/1
  # PUT /matters/1.json
  def update
     @matter = Matter.find(params[:id])
    
    #Transitions of workflow
    case params[:submit_type]
    when 'draft'
    else
      @matter.submit!
    end

    respond_to do |format|
      if @matter.update_attributes(params[:matter])
        format.html { redirect_to admin_matter_url(@matter), notice: t('matter.successfully_update') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @matter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matters/1
  # DELETE /matters/1.json
  def destroy
    @matter = Matter.find(params[:id])
    @matter.destroy

    respond_to do |format|
      format.html { redirect_to admin_matters_url }
      format.json { head :no_content }
    end
  end

  def user_is_not_author
    respond_to do |format|
      format.html { redirect_to admin_matters_url, alert: t('errors.messages.item_in_use') }
      format.json { head :no_content, status: :access_denied }
    end
  end
end
