# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @posts = Post.includes(:category, :creator).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @new_post_comment = @post.comments.build
    @post_comments = @post.comments.arrange
    @post_likes_count = @post.likes.count
    @current_user_post_like = @post.likes.find_by(user_id: current_user.id) if current_user
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:notice] = t('posts.flash.notice')
      redirect_to @post
    else
      flash[:alert] = t('posts.flash.alert')
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.required(:post).permit(:title, :body, :category_id)
  end
end
