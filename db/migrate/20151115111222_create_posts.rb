class CreatePosts < ActiveRecord::Migration
	def change
		create_table :posts do |t|
			t.belongs_to	:user,		null: false
			t.string		:title,		null: false
			t.text			:text,		null: false
			t.integer		:count,		default: 0
			t.boolean		:flag,		default: true

			t.timestamps null: false
		end
	end
end
