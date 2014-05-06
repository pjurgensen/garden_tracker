class AddDefaultValueToCompletedProperty < ActiveRecord::Migration
  def up
    change_column :garden_tasks, :completed, :boolean, :default => false
	end

	def down
	  change_column :garden_tasks, :completed, :boolean, :default => nil
	end
end
