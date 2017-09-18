class CommentsController < ApplicationController
  def create
    validate_comments!(params)
    create_service.create_comment!(params, comment_params)

    flash[:success] = 'コメントしました。'
  rescue
    flash[:error] ||= 'コメントに失敗しました。'
  ensure
    redirect_to article_path(params[:article_id])
  end

  private

  def create_service
    @create_service || CommentService::CreateService.new
  end

  def comment_params
    params.require(:comment).permit(:username, :body)
  end

  def validate_comments!(params)
    comments = ArticleComment.where(article_id: params[:article_id])

    if comments.length >= 1000
      flash[:error] = 'コメントは1000件までです。'
      raise
    end
  end
end
