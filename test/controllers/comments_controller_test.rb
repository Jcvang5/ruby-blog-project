# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @category = categories(:one)
    @article = articles(:one)
    @comment = comments(:one)
  end

  test "should get index" do
    get category_article_comments_url(@comment)
    assert_response :success
  end

  test "should show article" do
    get category_article_comments_url(@category, @article, @comment)
    assert_response :success
  end

  test "should get new" do
    sign_in @user
    get new_category_article_comments_url(@category, @article, @comments)
    assert_response :success
  end

  test "should create article" do
    sign_in @user
    assert_difference('Comment.count') do
      post category_articles_comments_url(@category, @article, @comments), params: { comment: { commenter: "New Article", body: "Lorem ipsum", status: "public" } }
    end

    assert_redirected_to category_article_comments_url(@category, @article, @comment, Comment.last)
  end

  test "should get edit" do
    sign_in @user
    get edit_category_article_url(@category, @article, @comment)
    assert_response :success
  end

  test "should update article" do
    sign_in @user
    patch category_article_url(@category, @article, @comment), params: { comment: { commenter: "Updated commenter" } }
    assert_redirected_to category_article_comments_url(@category, @article, @comment)
    @comment.reload
    assert_equal "Updated commenter", @comment.commenter
  end

  test "should destroy article" do
    sign_in @user
    assert_difference do
      delete category_article_url(@category, @article, @comment)
    end

    assert_redirected_to category_articles_comments_url(@comment)
  end
end
