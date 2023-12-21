# frozen_string_literal: true

require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    @category = categories(:one)
    @article = articles(:one)
  end

  test "should get index" do
    get category_articles_url(@category)
    assert_response :success
  end

  test "should show article" do
    get category_article_url(@category, @article)
    assert_response :success
  end

  test "should get new" do
    sign_in @user
    get new_category_article_url(@category)
    assert_response :success
  end

  test "should create article" do
    sign_in @user
    assert_difference('Article.count') do
      post category_articles_url(@category), params: { article: { title: "New Article", body: "Lorem ipsum", status: "public" } }
    end

    assert_redirected_to category_article_url(@category, Article.last)
  end

  test "should get edit" do
    sign_in @user
    get edit_category_article_url(@category, @article)
    assert_response :success
  end

  test "should update article" do
    sign_in @user
    patch category_article_url(@category, @article), params: { article: { title: "Updated Title" } }
    assert_redirected_to category_article_url(@category, @article)
    @article.reload
    assert_equal "Updated Title", @article.title
  end

  test "should destroy article" do
    sign_in @user
    assert_difference('Article.count', -1) do
      delete category_article_url(@category, @article)
    end

    assert_redirected_to category_articles_url(@category)
  end
end