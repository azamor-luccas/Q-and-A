require "test_helper"
require 'minitest/autorun'

class QuestionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get questions_url
    keys = %w[id description]
    response_contains_keys = (keys - @response.parsed_body[0].keys).empty?

    assert_response :success
    assert response_contains_keys
  end

  test "should return not_found when question does not exists" do
    Question.stub(:find_by, nil) do
      get question_url(Question.first.id)
    end
    assert_response :missing
  end

  test "should return question data when question exists" do
    get question_url(Question.first.id)

    question_keys = %w[id description user answers]
    response_contains_keys = (question_keys - @response.parsed_body.keys).empty?

    assert_response :success
    assert response_contains_keys
  end

  test "should create one question" do
    assert_difference("Question.count", 1) do
      post questions_url,
           params: { description: "lorem description", user_id: User.first.id }
    end
  end

  test "should not create question with empty description" do
    assert_difference("Question.count", 0) do
      post questions_url,
           params: { description: "", user_id: User.first.id }
    end
    assert_response :unprocessable_entity
  end
end
