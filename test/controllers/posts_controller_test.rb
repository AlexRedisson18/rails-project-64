# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @post = posts(:one)

    @post_params = {
      post: {
        title: 'Post title',
        body: Faker::Lorem.paragraph_by_chars(number: 210),
        category_id: users(:one).id,
        creator_id: categories(:one).id
      }
    }
  end

  test 'should get index' do
    get posts_url
    assert_response :success
  end

  test 'should get new' do
    get new_post_url
    assert_response :success
  end

  test 'should create post' do
    post posts_url, params: @post_params

    post = Post.find_by(@attrs)
    assert { post }
    assert_redirected_to post_url(Post.last)
  end

  test 'should show post' do
    get post_url(@post)
    assert_response :success
  end
end
