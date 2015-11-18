class CreatePostcomments < ActiveRecord::Migration
	def change
		create_table :postcomments do |t|
			t.belongs_to	:post,		null: false
			t.belongs_to	:user,		null: false
			t.text			:text,		null: false
			t.boolean		:flag,		default: true

			t.timestamps null: false
		end
	end
end
