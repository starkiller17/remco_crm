class CategoriesController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_category, only: [:show, :edit, :update]
    before_action :require_user, except: [:index]

    def new
        @category = Category.new
    end

    def index
        @categories = Category.all
    end

    def create
        begin
            puts params[:category][:category].upcase!
            @category = Category.new(category_params)
            puts "*" * 100
            puts category_params[:updated_by]
            puts "*" * 100
            if @category.save
                flash[:notice] = "¡Categoría creada exitosamente!"
                redirect_to new_category_path
            else
                render 'new'
            end
        rescue => e
            puts "Exepción #{e}"
        end
    end

    def show

    end

    def edit
    end
    
    def update
        if @category.update(category_params)
            flash[:notice] = "¡La categoría se ha actualizado!"
            redirect_to categories_path
        else
            render 'edit'
        end
    end

    private
    def category_params
        params.require(:category).permit(:category, :status, :created_by, :updated_by)
    end

    def set_category
        @category = Category.find(params[:id])
    end
end