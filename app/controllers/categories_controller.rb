# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @articles = @category.articles
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(categories_params)

    if @category.save
      redirect_to category_path(@category), notice: 'Category was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @category.update(categories_params)
      redirect_to root_path, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path, notice: 'Article was successfully destroyed.'
    @category.destroy
  end

  private

  def set_category; end

  def categories_params
    params.require(:category).permit(:name, :description)
  end
end
