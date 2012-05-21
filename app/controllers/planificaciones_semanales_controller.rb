class PlanificacionesSemanalesController < ApplicationController
  before_filter :verificar_semanas, :only => :index
  
  # GET /planificaciones_semanales
  # GET /planificaciones_semanales.json
  def index
    # Si se filtró, lo que pidieron, si no lo que está
    # en la sesión, y si no este mes.
    unless params[:periodo].nil?
      session[:periodo_ps] = params[:periodo]
    else
      session[:periodo_ps] ||= 'este_mes'
    end

    case session[:periodo_ps]
      when 'este_mes'
        desde = Date.today.at_beginning_of_month
        hasta = Date.today.at_end_of_month
          
        @semanas = Semana.where(" hasta > :desde and desde < :hasta ", :desde => desde, :hasta => hasta)
      when 'este_y_prox'
        desde = Date.today.at_beginning_of_month
        hasta = Date.today.next_month.at_end_of_month
        
        @semanas = Semana.where(" hasta > :desde and desde < :hasta ", :desde => desde, :hasta => hasta)
      when 'todos'        
        @semanas = Semana.all
    end
     
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
        format.html { redirect_to planificaciones_semanales_path, notice: 'Planificacion semanal was successfully created.' }
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
        format.html { redirect_to planificaciones_semanales_path, notice: 'Planificacion semanal was successfully updated.' }
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

private
  def verificar_semanas
    hoy = Date.today

    # Asegurarse que las semanas del mes en curso, el anterior y el próximo existen
    Semana.crear_semanas_mes hoy.prev_month    
    Semana.crear_semanas_mes hoy
    Semana.crear_semanas_mes hoy.next_month
  end
end
