class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = current_user.likes.new like_params
    @like.save
    like_condition params[:like][:post_id], params[:like][:comment_id]
    @like_of_user = Like.where(user: current_user).group_by{|x| [x.post_id, x.comment_id]}
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @like = Like.find_by id: params[:id]
    @like.lock!.destroy
    like_condition @like.post_id, @like.comment_id
    @like_of_user = Like.where(user: current_user).group_by{|x| [x.post_id, x.comment_id]}
    respond_to do |format|
      format.js
    end
  end

  private

  def like_params
    params.require(:like).permit Like::PARAMS
  end

  def like_condition post_id, comment_id
    if post_id.present?
      @like_posts = Like.where(post_id: post_id).group_by(&:post_id)
    else
      @like_comments = Like.where(comment_id: comment_id).group_by(&:comment_id)
    end
  end
end
