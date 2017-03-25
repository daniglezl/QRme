class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @forum_thread = ForumThread.find(params[:forum_thread_id])
    @comment = @forum_thread.comments.build parent_id: params[:parent_id]
  end

  def create
    @forum_thread = ForumThread.find(params[:forum_thread_id])
    @comment = @forum_thread.comments.build comment_params
    if @comment.save
      @comment.update_attribute :user_id, current_user.id
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @forum_thread = @comment.forum_thread
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes(comment_params)
    @forum_thread = @comment.forum_thread
  end

  def destroy
    @comment = Comment.find(params[:id])
    @forum_thread = @comment.forum_thread
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :parent_id)
  end

end
