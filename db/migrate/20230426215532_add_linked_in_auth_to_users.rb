class AddLinkedInAuthToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :linkedin_url, :text
    add_column :users, :linkedin_image_url, :text
    add_column :users, :name, :string
  end
end
