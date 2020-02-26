class CategoriesController < ApplicationController

    def index 
        categories = Category.all 
        render json: categories, each_serializer: CategorySerializer 
    end

    def show 
        category = Category.find(params[:id])
        render json: category, serializer: ShowCategorySerializer
    end
    
end
