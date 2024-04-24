# frozen_string_literal: true

if Rails.env.development?
  PostComment.destroy_all

  user = User.first
  post = user.posts.first
  user.posts.last

  comment1 = PostComment.create(user:, post:, content: 'this is comment with comments')
  comment2 = PostComment.create(user:, post:, content: 'commented comment', parent: comment1)
  PostComment.create(user:, post:, content: 'deep comment', parent: comment2)

  PostComment.create(user:, post:, content: 'first')
end
