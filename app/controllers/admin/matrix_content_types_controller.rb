class Admin::MatrixContentTypesController < ApplicationController
  # GET /matrix_content_types
  # GET /matrix_content_types.json
  def index
    @matrix_content_types = MatrixContentType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @matrix_content_types, :include => [:matter_father, :matter, :content_type] }
    end
  end

  # GET /matters/matter_father/search
  def search
    if params[:content_type_id]
      @matrix_content_types = MatrixContentType.find_by_content_type_id(params[:content_type_id])  
    end  

    
    
    respond_to do |format|
      format.json { render json: @matrix_content_types, :include => [:matter_father, :matter, :content_type] }
    end
  end

  # GET /matrix_content_types/1
  # GET /matrix_content_types/1.json
  def show
    @matrix_content_type = MatrixContentType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @matrix_content_type }
    end
  end

  # GET /matrix_content_types/new
  # GET /matrix_content_types/new.json
  def new
    @matrix_content_type = MatrixContentType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @matrix_content_type }
    end
  end

  # GET /matrix_content_types/1/edit
  def edit
    @matrix_content_type = MatrixContentType.find(params[:id])
  end

  # POST /matrix_content_types
  # POST /matrix_content_types.json
  def create
    @matrix_content_type = MatrixContentType.new(params[:matrix_content_type])

    respond_to do |format|
      if @matrix_content_type.save
        format.html { redirect_to admin_matrix_content_type_path(@matrix_content_type), notice: 'Matrix content type was successfully created.' }
        format.json { render json: @matrix_content_type, status: :created, location: @matrix_content_type }
      else
        format.html { render action: "new" }
        format.json { render json: @matrix_content_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /matrix_content_types/1
  # PUT /matrix_content_types/1.json
  def update
    @matrix_content_type = MatrixContentType.find(params[:id])

    respond_to do |format|
      if @matrix_content_type.update_attributes(params[:matrix_content_type])
        format.html { redirect_to admin_matrix_content_type_path(@matrix_content_type), notice: 'Matrix content type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @matrix_content_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matrix_content_types/1
  # DELETE /matrix_content_types/1.json
  def destroy
    @matrix_content_type = MatrixContentType.find(params[:id])
    @matrix_content_type.destroy

    respond_to do |format|
      format.html { redirect_to admin_matrix_content_types_url }
      format.json { head :no_content }
    end
  end
end
