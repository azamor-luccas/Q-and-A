require "test_helper"

class QuestionTest < ActiveSupport::TestCase
  test "should not create a question with user_id null" do
    question = Question.new
    assert_not question.save, "saved question without an user"
  end
end
