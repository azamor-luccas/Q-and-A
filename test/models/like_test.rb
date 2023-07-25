require "test_helper"

class LikeTest < ActiveSupport::TestCase
  test "should not create a like without an user" do
    like = Like.new
    like.question = Question.first
    assert_not like.save, "saved a like without a user"
  end

  test "should not create a like with question and answer" do
    like = Like.new
    like.user = User.first
    like.question = Question.first
    like.answer = Answer.first
    assert_not like.save, "saved a like with question and answer"
  end

  test "should not create a like without question and answer" do
    like = Like.new
    like.user = User.first
    assert_not like.save, "saved a like without question and answer"
  end

  test "should create a like with question" do
    like = Like.new
    like.user = User.first
    like.question = Question.first
    assert like.save!, "not saved a like with question"
  end

  test "should create a like with answer" do
    like = Like.new
    like.user = User.first
    like.answer = Answer.first
    assert like.save!, "not saved a like with answer"
  end
end
