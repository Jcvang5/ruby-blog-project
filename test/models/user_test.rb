# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should return comments from user" do
    user = User.create(first_name:"user", last_name:"name", username: "user", email: "user@gmail.com")

    comment1 = Comment.create(commenter: "Kenny", body: "hello", user: user)
    comment2 = Comment.create(commenter: "Kenny", body: "helooooo", user: user)

    user_comments = user.user_comments

    assert_equal [comment1, comment2], user_comments, "Should return comments from user"
  end
end
