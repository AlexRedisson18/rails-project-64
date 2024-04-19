# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)

    @user = users(:one)
    @post = posts(:one)

    @comment_params = { post_comment: { content: 'Some content' } }
  end

  test 'should create comment' do
    post post_comments_url @post, params: @comment_params

    assert_instance_of(PostComment, PostComment.find_by(@comment_params[:post_comment]))
    assert_redirected_to post_url(@post)
  end

  test 'should DONT create comment' do
    post post_comments_url @post, params: { post_comment: {} }

    refute_instance_of(PostComment, PostComment.find_by(@comment_params[:post_comment]))
  end
end
