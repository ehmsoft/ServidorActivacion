class SesionesController < ApplicationController
  def new
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    usuario = Usuario.find_by_correo(params[:sesion][:correo])
    if usuario && usuario.authenticate(params[:sesion][:password])
      sign_in usuario
      respond_to do |format|
        format.html { redirect_back_or usuarios_path}
        format.json { render json: {success: true, status: 200} }
      end

    else
      flash.now[:error] = 'Correo o contrasena invalida'
      respond_to do |format|
        format.html { render 'new'}
        format.json { render json: {success: false, status: 403} }
      end
    end
  end

  def destroy
    sign_out
    respond_to do |format|
      format.html { render 'new'}
      format.json { render json: {success: true, status: 200} }
    end
  end

end