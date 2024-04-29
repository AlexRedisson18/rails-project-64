# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @post_comment = @post.comments.build(comment_params)
    @post_comment.user = current_user

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
