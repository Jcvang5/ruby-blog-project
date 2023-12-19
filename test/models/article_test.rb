# frozen_string_literal: true

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "should have many comments" do
    article = Article.new(
      title: "Valid Title",
      body: "This is a valid body with more than 10 characters."
    )
    comment1 = Comment.new(commenter: "Commenter 1", body: "Comment body 1")
    comment2 = Comment.new(commenter: "Commenter 2", body: "Comment body 2")

    article.comments << comment1
    article.comments << comment2

    assert_equal 2, article.comments.length, "Article should have two comments"
    assert article.save, "Could not save article with comments"
  end

  test "should belong to a category" do
    category = Category.create(name: "Sample Category", description: "Category description")

    article = Article.new(
      title: "Valid Title",
      body: "This is a valid body with more than 10 characters.",
      category: category
    )

    assert article.save, "Could not save article with a category"
    assert_equal category.id, article.category.id, "Article should belong to the specified category"
  end


  test "should not save article without title" do
    category = Category.create(name: "Sample Category", description: "Category description")

    article = Article.new(
      body: "This is a valid body with more than 10 characters.",
      category: category
    )

    assert_not article.save, "Saved the article without a title"
  end

  test "should not save article with short body" do
    category = Category.create(name: "Sample Category", description: "Category description")

    article = Article.new(
      title: "Valid Title",
      body: "Short",
      category: category
    )

    assert_not article.save, "Saved the article with a short body"
  end

  test "should not save article without category" do
    article = Article.new(
      title: "Valid Title",
      body: "This is a valid body with more than 10 characters."
    )

    assert_not article.save, "Saved the article without a category"
  end
  
  test "should return five most recent articles" do
    # Create some articles with different creation times
    article1 = Article.create(title: "Article 1", body: "Body 1", created_at: 5.days.ago)
    article2 = Article.create(title: "Article 2", body: "Body 2", created_at: 4.days.ago)
    article3 = Article.create(title: "Article 3", body: "Body 3", created_at: 3.days.ago)
    article4 = Article.create(title: "Article 4", body: "Body 4", created_at: 2.days.ago)
    article5 = Article.create(title: "Article 5", body: "Body 5", created_at: 1.day.ago)

    recent_articles = Article.last_five

    assert_equal 5, recent_articles.length, "Should return five recent articles"

    assert_equal [article5, article4, article3, article2, article1], recent_articles, "Articles should be in descending order of creation time"
  end
end