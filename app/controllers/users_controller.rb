class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]
    before_action :require_user, only: [:edit, :update, :index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def new
        @user = User.new
    end

    def index
        @users = User.paginate(:page => params[:page], :per_page => 3)
    end

    def show
    end

    def edit
    end

    def update
        if @user.update(user_params)
            flash[:notice] = "La información de tu cuenta se actualizó exitosamente"
            redirect_to @user
        else
            render 'edit'
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            #session[:user_id] = @user.id
            flash[:notice] = "¡¡El usuario #{@user.username} se ha creado con éxito!!"
            redirect_to signup_path
        else
            #message = ""
            #@user.errors.full_messages.each do |msg|
            #    message += msg + "\n"
            #end
            #flash[:alert] = message
            #redirect_to signup_path
            render 'users/new'
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password, :status, :admin)
    end

    private
    def set_user
        @user = User.find(params[:id])
    end

    # Allow delete or edit only for same user or admin user
    def require_same_user
        if current_user != @user && !current_user.admin?
            flash[:alert] = "Sólo puedes editar o eliminar registros de tu propia cuenta"
            redirect_to @user
        end
    end

end