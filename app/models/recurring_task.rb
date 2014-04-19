class RecurringTask < ActiveRecord::Base
	validates :description, presence: true
	validates :frequency, presence: true
	validates :reference_date, presence: true

end