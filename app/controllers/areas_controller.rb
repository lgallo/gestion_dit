class AreasController < ApplicationController
  # GET /areas
  # GET /areas.json
  def index
    @areas = Area.order(:nombre)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @areas }
    end
  end

  def remove_usuario
    area = Area.find(params[:id])
    usuario = Usuario.find(params[:usuario_id])

    redirect_to area_path(area)    
  end

  def add_usuario
    area = Area.find(params[:id])
    usuario = Usuario.find(params[:usuario_id])
    
    area_usuario = AreaUsuario.new
    area_usuario.area = area
    area_usuario.usuario = usuario
    area_usuario.save!
    
    redirect_to area_path(area)
  end

  # GET /areas/1
  # GET /areas/1.json
  def show
    @area = Area.find(params[:id])
    @usuarios = Usuario.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @area }
    end
  end

  # GET /areas/new
  # GET /areas/new.json
  def new
    @area = Area.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @area }
    end
  end

  # GET /areas/1/edit
  def edit
    @area = Area.find(params[:id])
  end

  # POST /areas
  # POST /areas.json
  def create
    @area = Area.new(params[:area])

    respond_to do |format|
      if @area.save
        format.html { redirect_to @area, notice: 'Area was successfully created.' }
        format.json { render json: @area, status: :created, location: @area }
      else
        format.html { render action: "new" }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /areas/1
  # PUT /areas/1.json
  def update
    @area = Area.find(params[:id])

    respond_to do |format|
      if @area.update_attributes(params[:area])
        format.html { redirect_to @area, notice: 'Area was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /areas/1
  # DELETE /areas/1.json
  def destroy
    @area = Area.find(params[:id])
    @area.destroy

    respond_to do |format|
      format.html { redirect_to areas_url }
      format.json { head :ok }
    end
  end
end
