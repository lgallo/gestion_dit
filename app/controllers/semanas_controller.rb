class SemanasController < ApplicationController
  # GET /semanas
  # GET /semanas.json
  def index
    @semanas = Semana.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @semanas }
    end
  end

  # GET /semanas/1
  # GET /semanas/1.json
  def show
    @semana = Semana.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @semana }
    end
  end

  # GET /semanas/new
  # GET /semanas/new.json
  def new
    @semana = Semana.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @semana }
    end
  end

  # GET /semanas/1/edit
  def edit
    @semana = Semana.find(params[:id])
  end

  # POST /semanas
  # POST /semanas.json
  def create
    @semana = Semana.new(params[:semana])

    respond_to do |format|
      if @semana.save
        format.html { redirect_to @semana, notice: 'Semana was successfully created.' }
        format.json { render json: @semana, status: :created, location: @semana }
      else
        format.html { render action: "new" }
        format.json { render json: @semana.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /semanas/1
  # PUT /semanas/1.json
  def update
    @semana = Semana.find(params[:id])

    respond_to do |format|
      if @semana.update_attributes(params[:semana])
        format.html { redirect_to @semana, notice: 'Semana was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @semana.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /semanas/1
  # DELETE /semanas/1.json
  def destroy
    @semana = Semana.find(params[:id])
    @semana.destroy

    respond_to do |format|
      format.html { redirect_to semanas_url }
      format.json { head :ok }
    end
  end
end
