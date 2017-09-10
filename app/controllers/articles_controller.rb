class ArticlesController < ApplicationController
  def index
    @articles = Article.page(params[:page])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save!

    flash[:success] = '記事を作成しました。'

    redirect_to action: :index
  rescue
    render 'new'
  end

  def show
    @article = Article.find(params[:id])
  rescue
    redirect_to action: :index
  end

  def edit

  end

  def update
    redirect_to action: :index
  end

  def destroy
    @article = Article.find(params[:id])
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
end
