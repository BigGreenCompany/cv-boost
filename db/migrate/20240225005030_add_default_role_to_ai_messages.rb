class AddDefaultRoleToAiMessages < ActiveRecord::Migration[7.1]
  def change
    change_column_default :ai_messages, :role, from: nil, to: "user"
  end
end
