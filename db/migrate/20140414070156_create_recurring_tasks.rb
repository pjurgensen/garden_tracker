class CreateRecurringTasks < ActiveRecord::Migration
  def change
    create_table :recurring_tasks do |t|
    	t.text :description
    	t.integer :frequency
    	t.date :date

    	t.timestamps
    end
  end
end
