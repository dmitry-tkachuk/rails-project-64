# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should have many posts' do
    user = users(:first)
    assert_instance_of Post, user.posts.new, 'User does not have many posts'
  end

  test 'should have many comments' do
    user = users(:first)
    assert_instance_of PostComment, user.comments.new, 'User does not have many comments'
  end

  test 'should have many likes' do
    user = users(:first)
    assert_instance_of PostLike, user.likes.new, 'User does not have many likes'
  end

  test 'should validate presence of email' do
    user = User.new
    assert_not user.save, 'Saved the user without an email'
  end
end
