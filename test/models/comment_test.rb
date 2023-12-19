# frozen_string_literal: true

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  class CommentTest < ActiveSupport::TestCase
    test "should belong to an article" do
      article = Article.create(title: "Valid Title", body: "This body is going to have more than 10 words here.")
      comment = Comment.new(body: "This is a comment", article: article)
  
      assert comment.save, "Comment should be saved with an article"
      assert_equal article, comment.article, "Comment should belong to the article"
    end
  end
end
