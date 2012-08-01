class AplicacionesController < ApplicationController
  before_filter :signed_in_usuario
  # GET /aplicaciones
  # GET /aplicaciones.json
  def index
    @aplicaciones = Aplicacion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @aplicaciones }
    end
  end

  # GET /aplicaciones/1
  # GET /aplicaciones/1.json
  def show
    @aplicacion = Aplicacion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @aplicacion }
    end
  end

  # GET /aplicaciones/new
  # GET /aplicaciones/new.json
  def new
    @aplicacion = Aplicacion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @aplicacion }
    end
  end

  # GET /aplicaciones/1/edit
  def edit
    @aplicacion = Aplicacion.find(params[:id])
  end

  # POST /aplicaciones
  # POST /aplicaciones.json
  def create
    @aplicacion = Aplicacion.new(params[:aplicacion])

    respond_to do |format|
      if @aplicacion.save
        format.html { redirect_to @aplicacion, notice: 'Aplicacion was successfully created.' }
        format.json { render json: @aplicacion, status: :created, location: @aplicacion }
      else
        format.html { render action: "new" }
        format.json { render json: @aplicacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /aplicaciones/1
  # PUT /aplicaciones/1.json
  def update
    @aplicacion = Aplicacion.find(params[:id])

    respond_to do |format|
      if @aplicacion.update_attributes(params[:aplicacion])
        format.html { redirect_to @aplicacion, notice: 'Aplicacion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @aplicacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aplicaciones/1
  # DELETE /aplicaciones/1.json
  def destroy
    @aplicacion = Aplicacion.find(params[:id])
    @aplicacion.destroy

    respond_to do |format|
      format.html { redirect_to aplicaciones_url }
      format.json { head :no_content }
    end
  end
end
