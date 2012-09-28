class RequerimientosController < ApplicationController
  before_filter :cargar_combos, :only => [:new, :edit]
  helper_method :sort_column, :sort_direction
  
  # GET /requerimientos
  # GET /requerimientos.json
  def index
    # Si se filtró, lo que pidieron, si no lo que está
    # en la sesión, y si no el primer estado no finalizado
    unless params[:estado_id].nil?
      session[:filtro_estado_id] = params[:estado_id]
    else
      session[:filtro_estado_id] ||= Estado.where("nombre <> 'Finalizado'").first.id
    end
    
    @estado_id = session[:filtro_estado_id]
    
		if @estado_id.nil? or @estado_id == ""
			@requerimientos = Requerimiento.joined.order(sort_column + ' ' + sort_direction)
		elsif params['texto_buscado'].nil?
			@requerimientos = Requerimiento.joined.order(sort_column + ' ' + sort_direction).where(:estado_id => @estado_id)
		else
			where = "estado_id = :estado_id and (descripcion like '%#{params['texto_buscado']}%')"
			@requerimientos = Requerimiento.joined.order(sort_column + ' ' + sort_direction).where(where, estado_id: @estado_id, texto_buscado: params['texto_buscado'])
    end
    
    @estados = [Estado.new] 
    @estados.concat Estado.order(:nombre)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @requerimientos }
    end
  end

  # GET /requerimientos/1
  # GET /requerimientos/1.json
  def show
    @requerimiento ||= Requerimiento.where(:numero => params[:id]).first
    @areas = Area.where(" nombre like '%DIT%' ")

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
    @requerimiento.numero = Requerimiento.maximum(:numero) + 1
    
    respond_to do |format|
      if @requerimiento.save
        format.html { redirect_to "#{requerimientos_path}/#{@requerimiento.numero}", notice: 'Requerimiento was successfully created.' }
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
        format.html { redirect_to "#{requerimientos_path}/#{@requerimiento.numero}", notice: 'Requerimiento was successfully updated.' }
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
    @estados = Estado.all.map { |estado| [estado.nombre, estado.id] }
  end
  
  def valid_columns
    %w[us.apellido areas.nombre].concat(Requerimiento.column_names)
  end
  
  def sort_column
    valid_columns.include?(params[:sort]) ? params[:sort] : "numero"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
