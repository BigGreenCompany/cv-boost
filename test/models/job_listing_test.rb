require "test_helper"

class JobListingTest < ActiveSupport::TestCase
  test "fixture data is valid" do
    JobListing.all.each do |job_listing|
      assert job_listing.valid?, "#{job_listing.errors.full_messages}"
    end
  end
end
