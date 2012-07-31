module SesionesHelper
  def sign_in(usuario)
    cookies.permanent[:remember_token] = usuario.remember_token
    usuario_actual = usuario
  end

  def signed_in?
    !usuario_actual.nil?
  end

  def usuario_actual=(usuario)
    @usuario_actual = usuario
  end

  def usuario_actual
    @usuario_actual ||= Usuario.find_by_remember_token(cookies[:remember_token])
  end

  def usuario_actual?(usuario)
    usuario == usuario_actual
  end

  def signed_in_usuario
    respond_to do |format|
        format.html { redirect_to signin_path, notice: "Debe iniciar sesion." unless signed_in?}
        format.json { render json: {success: false, status: 403} unless signed_in?}
      end
      
  end

  def sign_out
    usuario_actual = nil
    cookies.delete(:remember_token)
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.fullpath
  end
end