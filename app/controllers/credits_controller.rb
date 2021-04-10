class CreditsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_credit, only: [:show, :edit, :update]
    before_action :require_user

    def index
        @credits = Credit.all
    end

    def new
        @credit = Credit.new
    end

    def create
        begin
            params[:credit][:credit].upcase!
            @credit = Credit.new(credit_params)
            if @credit.save
                flash[:notice] = "¡Crédito creado exitosamente!"
                redirect_to new_credit_path
            else
                render 'new'
            end
        rescue => e
            puts "Excepción #{e}"
        end
    end

    def edit

    end

    def update
        params[:credit][:credit].upcase!
        if @credit.update(credit_params)
            flash[:notice] = "¡Crédito se ha actualizado con éxito!"
            redirect_to credits_path
        else
            render 'edit'
        end
    end

    private
    def credit_params
        params.require(:credit).permit(:credit, :status, :created_by, :updated_by)
    end

    def set_credit
        @credit = Credit.find(params[:id])
    end

end