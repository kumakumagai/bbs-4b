class TagsController < ApplicationController
  def index
    @tags = Tag.page(params[:page])
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.save!

    flash[:success] = 'タグを作成しました。'

    redirect_to action: :index
  rescue
    render 'new'
  end

  def show
    @tag = find_tag(params)
  rescue
    redirect_to action: :index
  end

  private

  def find_tag(params)
    Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
