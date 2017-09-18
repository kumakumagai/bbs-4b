class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.article_comment = ArticleComment.new(article_id: params[:article_id], comment_id: comment_params[:id])

    comment.save!

    flash[:success] = 'コメントしました。'
  rescue
    flash[:error] = 'コメントに失敗しました。'
  ensure
    redirect_to article_path(params[:article_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:username, :body)
  end
end
