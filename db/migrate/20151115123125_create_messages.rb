class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender
      t.integer :receiver
      t.string :content
      t.boolean :receiver_flags
      t.boolean :sender_flags
      t.boolean :receiver_destroy
      t.boolean :sender_destroy

      t.timestamps null: false
    end
  end
end
