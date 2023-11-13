class CategoriesController < ApplicationController
    before_action :set_category, only: %i[edit update destroy]
    http_basic_authenticate_with name: 'hod', password: 'secret', except: %i[index]
    def index
      @categories = Category.all
    end
  
    def show
      @category = Category.find(params[:id])
      if @category
        @articles = @category.articles
      else
        redirect_to root_path, notice: "article is not found"
      end
    end
  
    def new
      @category = Category.new
    end
  
    def create
      @category = Category.new(categories_params)
  
      if @category.save
        redirect_to category_articles_path(@category), notice: 'Category was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
      # @category
    end
  
    def update
      if @category.update(categories_params)
        redirect_to root_path, notice: 'Category was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @category.destroy
      redirect_to root_path, notice: 'Article was successfully destroyed.'
    end
  
  
    private
  
    def set_category
      @category = Category.find(params[:id])
    end
  
    def categories_params
      params.require(:category).permit(:name, :description)
    end
  end