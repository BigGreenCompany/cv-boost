require "test_helper"

class JobListingsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @job_listing = job_listings(:one)
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get job_listings_url
    assert_response :success
  end

  test "should get new" do
    get new_job_listing_url
    assert_response :success
  end

  test "should create job_listing" do
    assert_difference("JobListing.count") do
      post job_listings_url, params: { job_listing: { description: @job_listing.description, employer: @job_listing.employer, job_type: @job_listing.job_type, location: @job_listing.location, title: @job_listing.title, user_id: @job_listing.user_id } }
    end

    assert_redirected_to job_listing_url(JobListing.last)
  end

  test "should show job_listing" do
    get job_listing_url(@job_listing)
    assert_response :success
  end

  test "should get edit" do
    get edit_job_listing_url(@job_listing)
    assert_response :success
  end

  test "should update job_listing" do
    patch job_listing_url(@job_listing), params: { job_listing: { description: @job_listing.description, employer: @job_listing.employer, job_type: @job_listing.job_type, location: @job_listing.location, title: @job_listing.title, user_id: @job_listing.user_id } }
    assert_redirected_to job_listing_url(@job_listing)
  end

  test "should destroy job_listing" do
    assert_difference("JobListing.count", -1) do
      delete job_listing_url(@job_listing)
    end

    assert_redirected_to job_listings_url
  end
end
