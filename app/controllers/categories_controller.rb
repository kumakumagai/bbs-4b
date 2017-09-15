class CategoriesController < ApplicationController
  def index
    @categories = Category.page(params[:page])
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

  def show
    @category = find_category(params)
  rescue
    redirect_to action: :index
  end

  def edit
    @category = find_category(params)
  rescue
    redirect_to action: :index
  end

  def update
    @category = find_category(params)

    update_service.update!(@category, category_params)

    flash[:success] = 'カテゴリーを更新しました。'

    redirect_to action: :show
  rescue
    render 'edit'
  end

  private

  def find_category(params)
    Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

  def update_service
    @update_service ||= CategoryService::UpdateService.new
  end
end
