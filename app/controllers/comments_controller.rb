class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_comment, only: %w(edit update destroy)

  def new
    @comment = Comment.new
  end

  def edit; end

  def create
    @comment = current_user.comments.new comment_params
    @comment.save
    respond_to do |format|
      format.js
    end
  end

  def update
    @comment.update comment_params
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @comment.destroy
    @comments = Comment.of_posts @comment.post_id
    respond_to do |format|
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit Comment::PARAMS
  end

  def load_comment
    @comment = Comment.find_by id: params[:id]
    return if @comment

    flash[:danger] = t "flash.not_found"
    redirect_to root_path
  end
end
