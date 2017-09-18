module CommentService
  class CreateService
    def create_comment!(params, comment_params)
      ActiveRecord::Base.transaction do
        comment = Comment.new(comment_params)
        comment.article_comment = ArticleComment.new(article_id: params[:article_id], comment_id: comment_params[:id])

        comment.save!

        CommentAssoc.create!(parent_id: params[:comment_id], child_id: comment.id) if params[:comment_id]
      end
    end
  end
end