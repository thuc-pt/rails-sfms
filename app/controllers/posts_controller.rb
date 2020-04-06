class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_post, only: %i(edit update destroy)

  def edit; end

  def create
    @post = Post.new post_params.merge user: current_user, team_id: params[:team_id]
    @post.save
    respond_to do |format|
      format.js
    end
  end

  def update
    @post.update post_params
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def post_params
    params.require(:post).permit Post::PARAMS
  end

  def load_post
    @post = Post.find_by id: params[:id]
    return if @post

    flash[:danger] = t "flash.not_found"
    redirect_to root_path
  end
end
