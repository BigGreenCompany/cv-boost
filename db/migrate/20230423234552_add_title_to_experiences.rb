class AddTitleToExperiences < ActiveRecord::Migration[7.0]
  def change
    add_column :experiences, :title, :string
  end
end
