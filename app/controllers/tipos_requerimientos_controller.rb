class TiposRequerimientosController < ApplicationController
  # GET /tipos_requerimientos
  # GET /tipos_requerimientos.json
  def index
    @tipos_requerimientos = TipoRequerimiento.order(:nombre)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tipos_requerimientos }
    end
  end

  # GET /tipos_requerimientos/1
  # GET /tipos_requerimientos/1.json
  def show
    @tipo_requerimiento = TipoRequerimiento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tipo_requerimiento }
    end
  end

  # GET /tipos_requerimientos/new
  # GET /tipos_requerimientos/new.json
  def new
    @tipo_requerimiento = TipoRequerimiento.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tipo_requerimiento }
    end
  end

  # GET /tipos_requerimientos/1/edit
  def edit
    @tipo_requerimiento = TipoRequerimiento.find(params[:id])
  end

  # POST /tipos_requerimientos
  # POST /tipos_requerimientos.json
  def create
    @tipo_requerimiento = TipoRequerimiento.new(params[:tipo_requerimiento])

    respond_to do |format|
      if @tipo_requerimiento.save
        format.html { redirect_to @tipo_requerimiento, notice: 'Tipo requerimiento was successfully created.' }
        format.json { render json: @tipo_requerimiento, status: :created, location: @tipo_requerimiento }
      else
        format.html { render action: "new" }
        format.json { render json: @tipo_requerimiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tipos_requerimientos/1
  # PUT /tipos_requerimientos/1.json
  def update
    @tipo_requerimiento = TipoRequerimiento.find(params[:id])

    respond_to do |format|
      if @tipo_requerimiento.update_attributes(params[:tipo_requerimiento])
        format.html { redirect_to @tipo_requerimiento, notice: 'Tipo requerimiento was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @tipo_requerimiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipos_requerimientos/1
  # DELETE /tipos_requerimientos/1.json
  def destroy
    @tipo_requerimiento = TipoRequerimiento.find(params[:id])
    @tipo_requerimiento.destroy

    respond_to do |format|
      format.html { redirect_to tipos_requerimientos_url }
      format.json { head :ok }
    end
  end
end
