class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @comment = @commentable.comments.build
  end

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to [@commentable, @comments], notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @comment.update(comment_params)
      redirect_to [@commentable, @comment], notice: t('controllers.common.notice_update', name: Comment.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to [@commentable, @comment], notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

end
