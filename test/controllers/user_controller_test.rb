require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should create user" do
    assert_difference("User.count", 1) do
      post users_url, params: { name: "Luccas" }
    end
  end
end
