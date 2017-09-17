module ArticleService
  class UpdateService
    def update!(article, article_params)
      article.title = article_params[:title]
      article.body  = article_params[:body]

      article.save!
    end

    def destroy_categories(article)
      article_categories = ArticleCategory.where(article_id: article[:id])

      article_categories.each do |article_category|
        article_category.destroy!
      end
    end

    def destroy_tags(article)
      article_tags = ArticleTag.where(article_id: article[:id])

      article_tags.each do |article_tag|
        article_tag.destroy!
      end
    end
  end
end