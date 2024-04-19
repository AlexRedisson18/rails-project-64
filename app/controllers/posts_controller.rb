# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    default_categories = %w[Музыка Фильмы Программирование Игры Искусство]
    default_categories.each { |category| Category.find_or_create_by(name: category) }

    @posts = Post.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @new_post_comment = @post.comments.new
    @post_comments = @post.comments.arrange
    @post_likes_count = @post.likes.count
    @current_user_post_like = @post.likes.find_by(user_id: current_user.id) if current_user
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      flash[:notice] = 'New post was successfully created'
      redirect_to @post, notice: 'New post was successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.required(:post).permit(:title, :body, :category_id)
  end
end
