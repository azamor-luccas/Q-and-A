require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not creat user without a name" do
    user = User.new
    assert_not user.save, "Saved user without a name"
  end
end
