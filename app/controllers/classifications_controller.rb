class ClassificationsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_classification, only: [:show, :edit, :update]
    before_action :require_user

    def index
        @classifications = Classification.all
    end

    def new
        @classification = Classification.new
    end

    def create
        begin
            puts params[:classification][:classification].upcase!
            @classification = Classification.new(classification_params)
            if @classification.save
                flash[:notice] = "¡Clasificación creada exitosamente!"
                redirect_to new_classification_path
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
        if @classification.update(classification_params)
            flash[:notice] = "¡La clasificación se ha actualizado!"
            redirect_to classifications_path
        else
            render 'edit'
        end
    end

    private
    def classification_params
        params.require(:classification).permit(:classification, :status, :created_by, :updated_by)
    end

    def set_classification
        @classification = Classification.find(params[:id])
    end
end