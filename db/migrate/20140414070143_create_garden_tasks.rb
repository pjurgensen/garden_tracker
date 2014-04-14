class CreateGardenTasks < ActiveRecord::Migration
  def change
    create_table :garden_tasks do |t|
			t.text :description
			t.date :date

			t.timestamps
    end
  end
end
