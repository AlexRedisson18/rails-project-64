# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)

    @user = users(:one)
    @user2 = users(:two)

    @post = posts(:one)

    @like = post_likes(:one)
    @like2 = post_likes(:two)
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

  test 'should not delete other user like' do
    delete post_like_path(@post, @like2)

    assert_instance_of(PostLike, PostLike.find_by(user_id: @user2.id, post_id: @post.id))
    assert_redirected_to post_url(@post)
  end
end
