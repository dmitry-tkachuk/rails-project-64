# frozen_string_literal: true

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test 'should have many posts' do
    category = categories(:first)
    assert_instance_of Post, category.posts.new, 'Category does not have many posts'
  end

  test 'should validate uniqueness of name' do
    category = Category.new(name: categories(:first).name)
    assert_not category.save, 'Saved the category with non-unique name'
  end

  test 'should validate presence of name' do
    category = Category.new
    assert_not category.save, 'Saved the category without a name'
  end

  test 'should validate minimum name length' do
    category = Category.new(name: 'A')
    assert_not category.save, 'Saved the category with a name shorter than 3 characters'
  end

  test 'should validate maximum name length' do
    category = Category.new(name: 'A' * 41)
    assert_not category.save, 'Saved the category with a name longer than 40 characters'
  end
end
