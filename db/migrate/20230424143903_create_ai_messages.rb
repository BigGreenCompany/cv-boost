class CreateAiMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :ai_messages do |t|
      t.references :experience, null: false, foreign_key: true
      t.string :role
      t.text :content

      t.timestamps
    end
  end
end
