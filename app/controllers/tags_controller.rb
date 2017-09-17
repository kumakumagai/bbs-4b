class TagsController < ApplicationController
  before_action :authenticate_user!

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

  def edit
    @tag = find_tag(params)
  rescue
    redirect_to action: :index
  end

  def update
    @tag = find_tag(params)

    update_service.update!(@tag, tag_params)

    flash[:success] = 'タグを更新しました。'

    redirect_to action: :show
  rescue
    render 'edit'
  end

  def destroy
    @tag = find_tag(params)
    @tag.destroy!

    flash[:success] = 'タグを削除しました。'
  rescue
    flash[:error] = 'タグの削除に失敗しました。'
  ensure
    redirect_to action: :index
  end

  private

  def find_tag(params)
    Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end

  def update_service
    @tag_service ||= TagService::UpdateService.new
  end
end
