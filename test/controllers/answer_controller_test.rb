require "test_helper"

class AnswerControllerTest < ActionDispatch::IntegrationTest
  test "should create answer" do
    assert_difference("Answer.count", 1) do
      post question_answers_url(Question.first.id),
           params: { description: "lorem description", user_id: User.first.id }
    end
    assert_response :success
  end

  test "should not create answer without user" do
    assert_difference("Answer.count", 0) do
      post question_answers_url(Question.first.id),
           params: { description: "lorem description" }
    end
    assert_response :unprocessable_entity
  end
end
