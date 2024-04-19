# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post

  def create
    @post = Post.find(params[:post_id])
    @post.likes.create(user_id: current_user.id)

    redirect_to @post
  end

  def destroy
    @like = @post.likes.find_by(id: params[:id], user_id: current_user.id)
    @like&.delete

    redirect_to @post
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end
end
