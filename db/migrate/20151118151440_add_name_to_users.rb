class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :gender, :boolean
    add_column :users, :language_learn
    add_column :users, :language_speak
    add_column :users, :brief, :string
  end
end
