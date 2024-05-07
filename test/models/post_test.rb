# frozen_string_literal: true

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  setup do
    @user = users(:first)
    @post = posts(:first)
  end

  test 'should not save post without title' do
    @post.title = nil
    assert_not @post.save, 'Saved the post without a title'
  end

  test 'should not save post without body' do
    @post.body = nil
    assert_not @post.save, 'Saved the post without a body'
  end

  test 'should save post with valid attributes' do
    assert @post.save, 'Failed to save the post with valid attributes'
  end

  test 'should have a minimum title length of 5 characters' do
    @post.title = 'Test'
    assert_not @post.save, 'Saved the post with a title shorter than 5 characters'
  end

  test 'should have a maximum title length of 255 characters' do
    @post.title = 'a' * 256
    assert_not @post.save, 'Saved the post with a title longer than 255 characters'
  end

  test 'should have a minimum body length of 200 characters' do
    @post.body = 'Lorem ipsum'
    assert_not @post.save, 'Saved the post with a body shorter than 200 characters'
  end

  test 'should have a maximum body length of 4000 characters' do
    @post.body = 'a' * 4001
    assert_not @post.save, 'Saved the post with a body longer than 4000 characters'
  end

  test 'should return nil for like_by_user when current_user is nil' do
    assert_nil @post.like_by_user(nil), 'Did not return nil for like_by_user when current_user is nil'
  end

  test 'should return like for like_by_user when user has liked the post' do
    like = PostLike.find_or_create_by(post: @post, user: @user)
    assert_equal like, @post.like_by_user(@user), 'Did not return like for like_by_user when user has liked the post'
  end
end
