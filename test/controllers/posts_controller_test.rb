# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)

    @post = posts(:one)
    @params = {
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
    post posts_url, params: @params

    assert_instance_of(Post, Post.find_by(@params[:post]))

    assert_redirected_to post_url(Post.last)
  end

  test 'shoult DONT create post' do
    post posts_url, params: { post: {} }

    assert_not_instance_of(Post, Post.find_by(@params[:post]))
  end

  test 'should show post' do
    get post_url(@post)
    assert_response :success
  end
end
