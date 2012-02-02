class RequerimientosController < ApplicationController
  before_filter :cargar_combos, :only => [:new, :edit]
  # GET /requerimientos
  # GET /requerimientos.json
  def index
    @requerimientos = Requerimiento.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @requerimientos }
    end
  end

  # GET /requerimientos/1
  # GET /requerimientos/1.json
  def show
    @requerimiento = Requerimiento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @requerimiento }
    end
  end

  # GET /requerimientos/new
  # GET /requerimientos/new.json
  def new
    @requerimiento = Requerimiento.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @requerimiento }
    end
  end

  # GET /requerimientos/1/edit
  def edit
    @requerimiento = Requerimiento.find(params[:id])
  end

  # POST /requerimientos
  # POST /requerimientos.json
  def create
    @requerimiento = Requerimiento.new(params[:requerimiento])

    respond_to do |format|
      if @requerimiento.save
        format.html { redirect_to @requerimiento, notice: 'Requerimiento was successfully created.' }
        format.json { render json: @requerimiento, status: :created, location: @requerimiento }
      else
        format.html { render action: "new" }
        format.json { render json: @requerimiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /requerimientos/1
  # PUT /requerimientos/1.json
  def update
    @requerimiento = Requerimiento.find(params[:id])

    respond_to do |format|
      if @requerimiento.update_attributes(params[:requerimiento])
        format.html { redirect_to @requerimiento, notice: 'Requerimiento was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @requerimiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requerimientos/1
  # DELETE /requerimientos/1.json
  def destroy
    @requerimiento = Requerimiento.find(params[:id])
    @requerimiento.destroy

    respond_to do |format|
      format.html { redirect_to requerimientos_url }
      format.json { head :ok }
    end
  end
  
private 
  def cargar_combos
    @tipos_requerimientos = TipoRequerimiento.all.map { |tipo| [tipo.nombre, tipo.id] }
    @aplicaciones = Aplicacion.all.map { |aplicacion| [aplicacion.nombre, aplicacion.id] }
    @usuarios = Usuario.all.map { |usuario| [usuario.login, usuario.id] }
    @areas = Area.all.map { |area| [area.nombre, area.id] }
  end
end
