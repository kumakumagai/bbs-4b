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

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
