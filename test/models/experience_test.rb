require "test_helper"

class ExperienceTest < ActiveSupport::TestCase
  test "fixture data is valid" do
    Experience.all.each do |experience|
      assert experience.valid?, "#{experience.errors.full_messages}"
    end
  end
end
