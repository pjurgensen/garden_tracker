class AddCompletedColumn < ActiveRecord::Migration
  def change
  	add_column :garden_tasks, :completed, :boolean
  end
end
