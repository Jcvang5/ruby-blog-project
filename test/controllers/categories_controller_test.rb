# frozen_string_literal: true

require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @category = categories(:one)
  end

  test "should get index" do
    get category_url(@category)
    assert_response :success
  end

  test "should show category" do
    get category_url(@category)
    assert_response :success
  end

  test "should get new" do
    sign_in @user
    get new_category_url(@category)
    assert_response :success
  end

  test "should create category" do
    sign_in @user
    assert_difference('Article.count') do
      post category_articles_url(@category), params: { category: { name: "New Category"} }
    end

    assert_redirected_to category_url(@category, Category.last)
  end

  test "should get edit" do
    sign_in @user
    get edit_category_url(@category)
    assert_response :success
  end

  test "should update category" do
    sign_in @user
    patch category_article_url(@category), params: { category: { name: "Updated Title" } }
    assert_redirected_to category_article_url(@category)
    @category.reload
    assert_equal "Updated category", @category.title
  end

  test "should destroy category" do
    sign_in @user
    assert_difference do
      delete category_url(@category)
    end

    assert_redirected_to category_url(@category)
  end
end