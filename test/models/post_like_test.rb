# frozen_string_literal: true

require 'test_helper'

class PostLikeTest < ActiveSupport::TestCase
  setup do
    @user = users(:first)
    @post = posts(:first)
  end

  test 'should belong to user' do
    post_like = PostLike.new(user: @user, post: @post)
    assert_equal @user, post_like.user, 'PostLike does not belong to user'
  end

  test 'should belong to post' do
    post_like = PostLike.new(user: @user, post: @post)
    assert_equal @post, post_like.post, 'PostLike does not belong to post'
  end
end
