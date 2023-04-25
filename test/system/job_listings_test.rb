require "application_system_test_case"

class JobListingsTest < ApplicationSystemTestCase
  setup do
    @job_listing = job_listings(:one)
  end

  test "visiting the index" do
    visit job_listings_url
    assert_selector "h1", text: "Job listings"
  end

  test "should create job listing" do
    visit job_listings_url
    click_on "New job listing"

    fill_in "Description", with: @job_listing.description
    fill_in "Employer", with: @job_listing.employer
    fill_in "Job type", with: @job_listing.job_type
    fill_in "Location", with: @job_listing.location
    fill_in "Title", with: @job_listing.title
    fill_in "User", with: @job_listing.user_id
    click_on "Create Job listing"

    assert_text "Job listing was successfully created"
    click_on "Back"
  end

  test "should update Job listing" do
    visit job_listing_url(@job_listing)
    click_on "Edit this job listing", match: :first

    fill_in "Description", with: @job_listing.description
    fill_in "Employer", with: @job_listing.employer
    fill_in "Job type", with: @job_listing.job_type
    fill_in "Location", with: @job_listing.location
    fill_in "Title", with: @job_listing.title
    fill_in "User", with: @job_listing.user_id
    click_on "Update Job listing"

    assert_text "Job listing was successfully updated"
    click_on "Back"
  end

  test "should destroy Job listing" do
    visit job_listing_url(@job_listing)
    click_on "Destroy this job listing", match: :first

    assert_text "Job listing was successfully destroyed"
  end
end
