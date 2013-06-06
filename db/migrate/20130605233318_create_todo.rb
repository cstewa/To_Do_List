class CreateTodo < ActiveRecord::Migration
  
 	def up
 		create_table :tasks do |t|
 			t.string :name
 			t.string :complete
 		end
  end

  def down
  	drop_table :tasks
  end
end
