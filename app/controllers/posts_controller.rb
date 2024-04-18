# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @new_post_comment = @post.comments.new
    @post_comments = @post.comments.arrange
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      flash[:notice] = 'New post was successfully created'
      redirect_to post_path(@post), notice: 'New post was successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.required(:post).permit(:title, :body, :category_id)
  end
end
