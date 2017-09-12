class CategoriesController < ApplicationController
  def index

  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.save!

    flash[:success] = 'カテゴリーを作成しました。'

    redirect_to action: :index
  rescue
    render 'new'
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
