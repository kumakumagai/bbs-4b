module ArticleService
  class IndexService
    attr_accessor :category_ids
    attr_accessor :tag_ids

    def category_condition(params)
      @category_ids = params[:article_categories]&.[](:category_id)

      @category_ids&.delete('')

      @category_ids ? { article_categories: { category_id: @category_ids } } : {}
    end

    def tag_condition(params)
      @tag_ids = params[:article_tags]&.[](:tag_id)

      @tag_ids&.delete('')

      @tag_ids ? { article_tags: { tag_id: @tag_ids } } : {}
    end

    def articles(params)
      Article.
          left_joins(:article_categories).
          left_joins(:article_tags).
          where(category_condition(params)).
          where(tag_condition(params)).
          group(:id).
          page(params[:page])
    end
  end
end