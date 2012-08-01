class CuentasController < ApplicationController
  before_filter :signed_in_usuario, only: [:index, :create, :show, :new, :update, :edit, :destroy]
  # GET /cuentas
  # GET /cuentas.json
  def index
    @cuentas = Cuenta.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cuentas }
    end
  end

  # GET /cuentas/1
  # GET /cuentas/1.json
  def show
    @cuenta = Cuenta.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cuenta }
    end
  end

  # GET /cuentas/new
  # GET /cuentas/new.json
  def new
    @cuenta = Cuenta.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cuenta }
    end
  end

  # GET /cuentas/1/edit
  def edit
    @cuenta = Cuenta.find(params[:id])
  end

  # POST /cuentas
  # POST /cuentas.json
  def create
    @cuenta = Cuenta.new(params[:cuenta])

    respond_to do |format|
      if @cuenta.save
        format.html { redirect_to @cuenta, notice: 'Cuenta was successfully created.' }
        format.json { render json: @cuenta, status: :created, location: @cuenta }
      else
        format.html { render action: "new" }
        format.json { render json: @cuenta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cuentas/1
  # PUT /cuentas/1.json
  def update
    @cuenta = Cuenta.find(params[:id])

    respond_to do |format|
      if @cuenta.update_attributes(params[:cuenta])
        format.html { redirect_to @cuenta, notice: 'Cuenta was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cuenta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cuentas/1
  # DELETE /cuentas/1.json
  def destroy
    @cuenta = Cuenta.find(params[:id])
    @cuenta.destroy

    respond_to do |format|
      format.html { redirect_to cuentas_url }
      format.json { head :no_content }
    end
  end
  
  
  def informacion
    @cuenta = Cuenta.where(correo: params[:correo], aplicacion_id: params[:aplicacion_id]).first
    respond_to do |format|
      format.xml {render 'activar'}
    end
  end
  
  def activar
    @cuenta = Cuenta.where(correo: params[:correo], aplicacion_id: params[:aplicacion_id]).first
    if @cuenta.pendiente > 0
      @cuenta.pendiente = @cuenta.pendiente - 1
      if @cuenta.save
        Registro.create(cuenta_id: @cuenta.id, hora: DateTime.now(), pendiente: @cuenta.pendiente, total: @cuenta.total)
      end
    else
      @cuenta = nil
    end
    respond_to do |format|
      format.xml #activar.xml.builder
    end
  end
  
  def desactivar
    @cuenta = Cuenta.where(correo: params[:correo], aplicacion_id: params[:aplicacion_id]).first
    if @cuenta.pendiente < @cuenta.total
      @cuenta.pendiente = @cuenta.pendiente + 1
      if @cuenta.save
        Registro.create(cuenta_id: @cuenta.id, hora: DateTime.now(), pendiente: @cuenta.pendiente, total: @cuenta.total)
      end
    else
      @cuenta = nil
    end
    respond_to do |format|
      format.xml {render 'activar'}
    end
  end
end
