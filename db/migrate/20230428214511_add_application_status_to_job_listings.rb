class AddApplicationStatusToJobListings < ActiveRecord::Migration[7.0]
  def change
    add_column :job_listings, :application_status, :string, default: "open"
  end
end
