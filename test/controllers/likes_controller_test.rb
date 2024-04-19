# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)

    @user = users(:one)
    @post = posts(:one)
    @like = post_likes(:one)
  end

  test 'should create like' do
    post post_likes_path(@post)
    assert_instance_of(PostLike, PostLike.find_by(user_id: @user.id, post_id: @post.id))

    assert_redirected_to post_url(@post)
  end

  test 'should delete like' do
    delete post_like_path(@post, @like)
    assert_not_instance_of(PostLike, PostLike.find_by(user_id: @user.id, post_id: @post.id))

    assert_redirected_to post_url(@post)
  end
end
