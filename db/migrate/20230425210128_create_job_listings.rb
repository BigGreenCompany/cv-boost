class CreateJobListings < ActiveRecord::Migration[7.0]
  def change
    create_table :job_listings do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :employer
      t.string :location
      t.string :job_type
      t.text :external_url

      t.timestamps
    end
  end
end
