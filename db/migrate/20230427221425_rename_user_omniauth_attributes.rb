class RenameUserOmniauthAttributes < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :name, :first_name
    add_column :users, :last_name, :string
    rename_column :users, :linkedin_image_url, :image_url
    remove_column :users, :linkedin_url, :text
  end
end
