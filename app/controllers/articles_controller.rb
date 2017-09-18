class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @articles = index_service.articles(params)

    @category_ids = index_service.category_ids || []
    @tag_ids      = index_service.tag_ids || []

    @categories = Category.names_and_ids
    @tags       = Tag.names_and_ids
  end

  def new
    @article = Article.new

    @article.article_categories.build
    @article.article_tags.build

    @categories = Category.names_and_ids
    @tags       = Tag.names_and_ids
  end

  def create
    @article = Article.new(article_params)

    ActiveRecord::Base.transaction do
      @article.save!

      create_service.create_categories!(params, @article)

      create_service.create_tags!(params, @article)
    end

    flash[:success] = '記事を作成しました。'

    redirect_to action: :index
  rescue
    @categories = Category.names_and_ids
    @tags       = Tag.names_and_ids

    render 'new'
  end

  def show
    @article = find_article(params)

    @comment  = Comment.new
    @comments = Comment.includes(:article_comment).where(article_comments: { article_id: @article.id })
  rescue
    redirect_to action: :index
  end

  def edit
    @article = find_article(params)

    @categories = Category.names_and_ids
    @tags       = Tag.names_and_ids
  rescue
    redirect_to action: :index
  end

  def update
    @article = find_article(params)

    ActiveRecord::Base.transaction do
      update_service.update!(@article, article_params)

      update_service.destroy_categories(@article)
      create_service.create_categories!(params, @article)

      update_service.destroy_tags(@article)
      create_service.create_tags!(params, @article)
    end

    flash[:success] = '記事を更新しました。'

    redirect_to action: :show
  rescue
    @categories = Category.names_and_ids
    @tags       = Tag.names_and_ids

    render 'edit'
  end

  def destroy
    @article = find_article(params)
    @article.destroy!

    flash[:success] = '記事を削除しました。'
  rescue
    flash[:error] = '記事の削除に失敗しました。'
  ensure
    redirect_to action: :index
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def find_article(params)
    Article.find(params[:id])
  end

  def create_service
    @create_service ||= ArticleService::CreateService.new
  end

  def update_service
    @update_service ||= ArticleService::UpdateService.new
  end

  def index_service
    @index_service ||= ArticleService::IndexService.new
  end
end
