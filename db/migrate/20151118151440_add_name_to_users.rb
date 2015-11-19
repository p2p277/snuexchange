class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :gender, :string
    add_column :users, :language_learn, :string
    add_column :users, :language_speak, :string
    add_column :users, :brief, :string
  end
end
