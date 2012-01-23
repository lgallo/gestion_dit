class GerenciaController < ApplicationController
  # GET /gerencia
  # GET /gerencia.json
  def index
    @gerencia = Gerencium.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gerencia }
    end
  end

  # GET /gerencia/1
  # GET /gerencia/1.json
  def show
    @gerencium = Gerencium.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gerencium }
    end
  end

  # GET /gerencia/new
  # GET /gerencia/new.json
  def new
    @gerencium = Gerencium.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gerencium }
    end
  end

  # GET /gerencia/1/edit
  def edit
    @gerencium = Gerencium.find(params[:id])
  end

  # POST /gerencia
  # POST /gerencia.json
  def create
    @gerencium = Gerencium.new(params[:gerencium])

    respond_to do |format|
      if @gerencium.save
        format.html { redirect_to @gerencium, notice: 'Gerencium was successfully created.' }
        format.json { render json: @gerencium, status: :created, location: @gerencium }
      else
        format.html { render action: "new" }
        format.json { render json: @gerencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gerencia/1
  # PUT /gerencia/1.json
  def update
    @gerencium = Gerencium.find(params[:id])

    respond_to do |format|
      if @gerencium.update_attributes(params[:gerencium])
        format.html { redirect_to @gerencium, notice: 'Gerencium was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @gerencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gerencia/1
  # DELETE /gerencia/1.json
  def destroy
    @gerencium = Gerencium.find(params[:id])
    @gerencium.destroy

    respond_to do |format|
      format.html { redirect_to gerencia_url }
      format.json { head :ok }
    end
  end
end
