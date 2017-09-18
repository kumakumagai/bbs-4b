class CommentsController < ApplicationController
  def create
    create_service.create_comment!(params, comment_params)

    flash[:success] = 'コメントしました。'
  rescue => e
    p e
    p e.backtrace
    flash[:error] = 'コメントに失敗しました。'
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
end
