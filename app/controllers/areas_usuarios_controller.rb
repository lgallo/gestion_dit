class AreasUsuariosController < ApplicationController
  # GET /areas_usuarios
  # GET /areas_usuarios.json
  def index
    @areas_usuarios = AreaUsuario.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @areas_usuarios }
    end
  end

  # GET /areas_usuarios/1
  # GET /areas_usuarios/1.json
  def show
    @area_usuario = AreaUsuario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @area_usuario }
    end
  end

  # GET /areas_usuarios/new
  # GET /areas_usuarios/new.json
  def new
    @area_usuario = AreaUsuario.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @area_usuario }
    end
  end

  # GET /areas_usuarios/1/edit
  def edit
    @area_usuario = AreaUsuario.find(params[:id])
  end

  # POST /areas_usuarios
  # POST /areas_usuarios.json
  def create
    @area_usuario = AreaUsuario.new(params[:area_usuario])

    respond_to do |format|
      if @area_usuario.save
        format.html { redirect_to @area_usuario, notice: 'Area usuario was successfully created.' }
        format.json { render json: @area_usuario, status: :created, location: @area_usuario }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @area_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /areas_usuarios/1
  # PUT /areas_usuarios/1.json
  def update
    @area_usuario = AreaUsuario.find(params[:id])

    respond_to do |format|
      if @area_usuario.update_attributes(params[:area_usuario])
        format.html { redirect_to @area_usuario, notice: 'Area usuario was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @area_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /areas_usuarios/1
  # DELETE /areas_usuarios/1.json
  def destroy
    @area_usuario = AreaUsuario.find(params[:id])
    @area_usuario.destroy

    respond_to do |format|
      format.html { redirect_to areas_usuarios_url }
      format.json { head :ok }
      format.js 
    end
  end
end
