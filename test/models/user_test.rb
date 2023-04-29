require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "fixture data is valid" do
    User.all.each do |user|
      assert user.valid?, "#{user.errors.full_messages}"
    end
  end
end
