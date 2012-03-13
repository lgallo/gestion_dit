class PlanificacionesRequerimientosController < ApplicationController
  # GET /planificaciones_requerimientos
  # GET /planificaciones_requerimientos.json
  def index
    @planificaciones_requerimientos = PlanificacionRequerimiento.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @planificaciones_requerimientos }
    end
  end

  # GET /planificaciones_requerimientos/1
  # GET /planificaciones_requerimientos/1.json
  def show
    @planificacion_requerimiento = PlanificacionRequerimiento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @planificacion_requerimiento }
    end
  end

  # GET /planificaciones_requerimientos/new
  # GET /planificaciones_requerimientos/new.json
  def new
    @planificacion_requerimiento = PlanificacionRequerimiento.new    
    @planificacion_requerimiento.planificacion = Planificacion.find_by_id(params[:id]) 

    @requerimientos = Requerimiento.joins(:estado).where(" estados.nombre <> 'Finalizado' ").map { |r| [r.nombre_combo, r.id] }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @planificacion_requerimiento }
    end
  end

  # GET /planificaciones_requerimientos/1/edit
  def edit
    @planificacion_requerimiento = PlanificacionRequerimiento.find(params[:id])
  end

  # POST /planificaciones_requerimientos
  # POST /planificaciones_requerimientos.json
  def create
    @planificacion_requerimiento = PlanificacionRequerimiento.new(params[:planificacion_requerimiento])

    respond_to do |format|
      if @planificacion_requerimiento.save
        format.html { redirect_to @planificacion_requerimiento, notice: 'Planificacion requerimiento was successfully created.' }
        format.json { render json: @planificacion_requerimiento, status: :created, location: @planificacion_requerimiento }
      else
        format.html { render action: "new" }
        format.json { render json: @planificacion_requerimiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /planificaciones_requerimientos/1
  # PUT /planificaciones_requerimientos/1.json
  def update
    @planificacion_requerimiento = PlanificacionRequerimiento.find(params[:id])

    respond_to do |format|
      if @planificacion_requerimiento.update_attributes(params[:planificacion_requerimiento])
        format.html { redirect_to @planificacion_requerimiento, notice: 'Planificacion requerimiento was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @planificacion_requerimiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /planificaciones_requerimientos/1
  # DELETE /planificaciones_requerimientos/1.json
  def destroy
    @planificacion_requerimiento = PlanificacionRequerimiento.find(params[:id])
    planificacion = @planificacion_requerimiento.planificacion 
    @planificacion_requerimiento.destroy

    respond_to do |format|
      format.html { redirect_to planificacion_path(planificacion) }
      format.json { head :ok }
    end
  end
end
