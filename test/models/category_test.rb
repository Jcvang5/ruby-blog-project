# frozen_string_literal: true

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should return total number of articles in the category" do
    category = Category.create(name: "Sample Category", description: "Category description")

    article1 = Article.create(title: "Article 1", body: "Body", category: category)
    article2 = Article.create(title: "Article 2", body: "Bodyy", category: category)
    article3 = Article.create(title: "Article 3", body: "Bodyyy", category: category)

    total = category.article_count

    assert_equal 3, total, "Should return the total number of articles in the category"
  end
end
