# frozen_string_literal: true

require 'test_helper'

class PostCommentTest < ActiveSupport::TestCase
  setup do
    @user = users(:first)
    @post = posts(:first)
  end

  test 'should have ancestry' do
    comment = PostComment.new
    assert_respond_to comment, :ancestry, 'PostComment does not have ancestry'
  end

  test 'should belong to post' do
    comment = PostComment.new(post: @post)
    assert_equal @post, comment.post, 'PostComment does not belong to post'
  end

  test 'should belong to user' do
    comment = PostComment.new(user: @user)
    assert_equal @user, comment.user, 'PostComment does not belong to user'
  end

  test 'should not save comment with content shorter than 5 characters' do
    comment = PostComment.new(content: 'short')
    assert_not comment.save, 'Saved the comment with content shorter than 5 characters'
  end

  test 'should not save comment with content longer than 400 characters' do
    comment = PostComment.new(content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
    assert_not comment.save, 'Saved the comment with content longer than 400 characters'
  end

  test 'should save comment without content length validation' do
    comment = PostComment.new(content: 'Valid comment', user: @user, post: @post)
    assert comment.save, 'Failed to save the comment without content length validation'
  end
end
