class CreateUsercomments < ActiveRecord::Migration
	def change
		create_table :usercomments do |t|
			
			t.integer :user_id
			t.integer :commenter_id
			t.string :content
			t.integer :score

			t.timestamps null: false
		end
	end
end
