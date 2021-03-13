class ApplicationController < ActionController::Base
    
    helper_method :current_user
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    helper_method :logged_in?
    def logged_in?
        # Converting current_user to boolean to know if user is logged in
        !!current_user
    end

    def require_user
        if !logged_in?
            flash[:alert] = "Inicia sesión para realizar esta acción."
            redirect_to root_path
        end
    end
end
