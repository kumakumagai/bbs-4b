module ArticleService
  class UpdateService
    def update!(article, article_params)
      article.title = article_params[:title]
      article.body  = article_params[:body]

      article.save!
    end
  end
end