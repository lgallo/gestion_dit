class RequerimientosAreasController < ApplicationController
  # GET /requerimientos_areas
  # GET /requerimientos_areas.json
  def index
    @requerimientos_areas = RequerimientoArea.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @requerimientos_areas }
    end
  end

  # GET /requerimientos_areas/1
  # GET /requerimientos_areas/1.json
  def show
    @requerimiento_area = RequerimientoArea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @requerimiento_area }
    end
  end

  # GET /requerimientos_areas/new
  # GET /requerimientos_areas/new.json
  def new
    @requerimiento_area = RequerimientoArea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @requerimiento_area }
    end
  end

  # GET /requerimientos_areas/1/edit
  def edit
    @requerimiento_area = RequerimientoArea.find(params[:id])
  end

  # POST /requerimientos_areas
  # POST /requerimientos_areas.json
  def create
    @requerimiento_area = RequerimientoArea.new(params[:requerimiento_area])
    @requerimiento_area.estimacion = 0

    respond_to do |format|
      if @requerimiento_area.save
        format.html { redirect_to @requerimiento_area, notice: 'Requerimiento area was successfully created.' }
        format.json { render json: @requerimiento_area, status: :created, location: @requerimiento_area }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @requerimiento_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /requerimientos_areas/1
  # PUT /requerimientos_areas/1.json
  def update
    @requerimiento_area = RequerimientoArea.find(params[:id])

    respond_to do |format|
      if @requerimiento_area.update_attributes(params[:requerimiento_area])
        format.html { redirect_to @requerimiento_area, notice: 'Requerimiento area was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @requerimiento_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requerimientos_areas/1
  # DELETE /requerimientos_areas/1.json
  def destroy
    @requerimiento_area = RequerimientoArea.find(params[:id])
    @requerimiento_area.destroy

    respond_to do |format|
      format.html { redirect_to requerimientos_areas_url }
      format.json { head :ok }
      format.js
    end
  end
end
