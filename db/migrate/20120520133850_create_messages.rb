class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.belongs_to :user
      t.string :text
      t.integer :to_user_id

      t.timestamps
    end
    add_index :messages, :user_id
  end
end
