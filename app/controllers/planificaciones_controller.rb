﻿class PlanificacionesController < ApplicationController
  before_filter :cargar_areas, :only => [:new, :edit]
  
  # GET /planificaciones
  # GET /planificaciones.json
  def index
    unless params[:id_area].nil?
      session[:filtro_area_id] = params[:id_area]
    end
    
    unless params[:periodo].nil?
      session[:filtro_periodo_planif] = params[:periodo]
    else
      session[:filtro_periodo_planif] ||= 'este_mes'
    end
    
    @id_area = session[:filtro_area_id]
    @periodo = session[:filtro_periodo_planif]
    
    @planificaciones = Planificacion.filtrar_por_periodo(@periodo, @id_area)    
    @planificaciones.sort_by!{ |p| [p.anio, p.mes]}.reverse! unless @planificaciones.nil?
    
    @areas = [Area.new( :id => -1, :nombre => "todas las áreas")].concat(Area.where(" nombre like '%DIT%' "))

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @planificaciones }
    end
  end

  # GET /planificaciones/1
  # GET /planificaciones/1.json
  def show
    @planificacion = Planificacion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @planificacion }
    end
  end

  # GET /planificaciones/new
  # GET /planificaciones/new.json
  def new
    @planificacion = Planificacion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @planificacion }
    end
  end

  # GET /planificaciones/1/edit
  def edit
    @planificacion = Planificacion.find(params[:id])
  end

  # POST /planificaciones
  # POST /planificaciones.json
  def create
    @planificacion = Planificacion.new(params[:planificacion])
    
    @planificacion.cantidad_personas = 0
    @planificacion.dias_mes = 0
    @planificacion.coeficiente_ajuste = 0
    @planificacion.dias_totales = 0

    respond_to do |format|
      if @planificacion.save
        format.html { redirect_to @planificacion, notice: 'Planificacion was successfully created.' }
        format.json { render json: @planificacion, status: :created, location: @planificacion }
      else
        format.html { render action: "new" }
        format.json { render json: @planificacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /planificaciones/1
  # PUT /planificaciones/1.json
  def update
    @planificacion = Planificacion.find(params[:id])    

    respond_to do |format|
      if @planificacion.update_attributes(params[:planificacion])
        format.html { redirect_to @planificacion, notice: 'Planificacion was successfully updated.' }
        format.json { render :json => { "dias_totales_calculados" => @planificacion.dias_totales_calculados } }
      else
        format.html { render action: "edit" }
        format.json { render json: @planificacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /planificaciones/1
  # DELETE /planificaciones/1.json
  def destroy
    @planificacion = Planificacion.find(params[:id])
    @planificacion.destroy

    respond_to do |format|
      format.html { redirect_to planificaciones_url }
      format.json { head :ok }
    end
  end
  
private
  def cargar_areas
    @areas = Area.where(" nombre like '%DIT%' ").map { |area| [area.nombre, area.id] }
  end
end
