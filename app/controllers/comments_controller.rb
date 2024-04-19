# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @post_comment = PostComment.new(comment_params.merge(user_id: current_user.id, post_id: params[:post_id]))

    if @post_comment.save
      flash[:notice] = t('comments.flash.notice')
    else
      flash[:alert] = t('comments.flash.alert')
    end

    redirect_to @post
  end

  private

  def comment_params
    params.required(:post_comment).permit(:content, :parent_id)
  end
end
