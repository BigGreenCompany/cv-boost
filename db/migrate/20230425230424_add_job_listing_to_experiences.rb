class AddJobListingToExperiences < ActiveRecord::Migration[7.0]
  def change
    add_reference :experiences, :job_listing, foreign_key: true
  end
end
