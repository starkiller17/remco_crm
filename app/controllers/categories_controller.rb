class CategoriesController < ApplicationController

    def index
        @categories = Category.all
    end

    def show

    end

    def create
        @category = Category.new(category_params)
        if @category.save
            flash[:notice] = "¡Categoría creada exitosamente!"
            redirect_to categories_path
        end
    end

    def udpate
        
    end

    private
    def category_params
        params.require(:category).permit(:status, :current_user)
    end
end