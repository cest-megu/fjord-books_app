class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to [@commentable, @comment], notice: t('controllers.common.notice_create', name: Comment.model_name.human)
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

end
