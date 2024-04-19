# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post
  before_action :find_like

  def create
    @post.likes.create(user_id: current_user.id)

    redirect_to @post
  end

  def destroy
    @like.delete

    redirect_to @post
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_like
    @like = @post.likes.find_by(user_id: current_user.id)
  end
end
