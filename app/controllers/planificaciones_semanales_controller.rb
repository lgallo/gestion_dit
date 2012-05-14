class PlanificacionesSemanalesController < ApplicationController
  # GET /planificaciones_semanales
  # GET /planificaciones_semanales.json
  def index
    @semanas = Semana.all
    @usuarios = Usuario.where(:carga_planificacion => true)
    
    @planificaciones_semanales = PlanificacionSemanal.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @planificaciones_semanales }
    end
  end

  # GET /planificaciones_semanales/1
  # GET /planificaciones_semanales/1.json
  def show
    @planificacion_semanal = PlanificacionSemanal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @planificacion_semanal }
    end
  end

  # GET /planificaciones_semanales/new
  # GET /planificaciones_semanales/new.json
  def new
    usuario = Usuario.find(params[:usuario_id])
    semana = Semana.find(params[:semana_id])
    
    @planificacion_semanal = PlanificacionSemanal.new(:usuario => usuario, :semana => semana)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @planificacion_semanal }
    end
  end

  # GET /planificaciones_semanales/1/edit
  def edit
    @planificacion_semanal = PlanificacionSemanal.find(params[:id])
  end

  # POST /planificaciones_semanales
  # POST /planificaciones_semanales.json
  def create
    @planificacion_semanal = PlanificacionSemanal.new(params[:planificacion_semanal])

    respond_to do |format|
      if @planificacion_semanal.save
        format.html { redirect_to @planificacion_semanal, notice: 'Planificacion semanal was successfully created.' }
        format.json { render json: @planificacion_semanal, status: :created, location: @planificacion_semanal }
      else
        format.html { render action: "new" }
        format.json { render json: @planificacion_semanal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /planificaciones_semanales/1
  # PUT /planificaciones_semanales/1.json
  def update
    @planificacion_semanal = PlanificacionSemanal.find(params[:id])

    respond_to do |format|
      if @planificacion_semanal.update_attributes(params[:planificacion_semanal])
        format.html { redirect_to @planificacion_semanal, notice: 'Planificacion semanal was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @planificacion_semanal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /planificaciones_semanales/1
  # DELETE /planificaciones_semanales/1.json
  def destroy
    @planificacion_semanal = PlanificacionSemanal.find(params[:id])
    @planificacion_semanal.destroy

    respond_to do |format|
      format.html { redirect_to planificaciones_semanales_url }
      format.json { head :ok }
    end
  end
end
