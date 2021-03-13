class SessionsController < ApplicationController
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password]) && user.status? && user.admin?
            session[:user_id] = user.id
            flash[:notice] = "¡Inicio de sesión exitoso!"
            redirect_to home_path
        else
            flash.now[:alert] = "Algo salió mal al intentar iniciar sesión con tus credenciales"
            render 'new'
        end
    end

    def new

    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "Sesión cerrada"
        redirect_to root_path
    end
end