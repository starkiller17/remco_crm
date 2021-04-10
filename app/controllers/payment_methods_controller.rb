class PaymentMethodsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_payment_method, only: [:show, :edit, :update]
    before_action :require_user

    def index
        @payment_methods = PaymentMethod.all
    end

    def new
        @payment_method = PaymentMethod.new
    end

    def create
        begin
            params[:payment_method][:payment_method].upcase!
            @payment_method = PaymentMethod.new(payment_method_params)
            if @payment_method.save
                flash[:notice] = "¡Método de Pago creado exitosamente!"
                redirect_to new_payment_method_path
            else
                render 'new'
            end
        rescue => exception
            puts "Excepción #{exception}"
        end
    end

    def edit

    end

    def update
        params[:payment_method][:payment_method].upcase!
        if @payment_method.update(payment_method_params)
            flash[:notice] = "¡Método de Pago actualizado con éxito!"
            redirect_to payment_methods_path
        else
            render 'edit'
        end
    end

    private
    def payment_method_params
        params.require(:payment_method).permit(:payment_method, :status, :created_by, :updated_by)
    end

    def set_payment_method
        payment_method = PaymentMethod.find(params[:id])
    end

end