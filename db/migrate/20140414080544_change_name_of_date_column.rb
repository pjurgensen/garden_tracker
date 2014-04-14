class ChangeNameOfDateColumn < ActiveRecord::Migration
  def change

  	rename_column :recurring_tasks, :date, :reference_date
  
  end
end
