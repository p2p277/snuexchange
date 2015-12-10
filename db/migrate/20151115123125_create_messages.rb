class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender
      t.integer :receiver
      t.string :content
      t.boolean :flags
      t.boolean :sender_destroy
      t.boolean :receiver_destroy

      t.timestamps null: false
    end
  end
end
