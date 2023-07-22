require "test_helper"

class AnswerControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get answer_create_url
    assert_response :success
  end
end
