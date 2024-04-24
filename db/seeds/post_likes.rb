# frozen_string_literal: true

if Rails.env.development?
  PostLike.destroy_all

  user = User.first
  post = user.posts.last

  post.likes.create(user:)
end
