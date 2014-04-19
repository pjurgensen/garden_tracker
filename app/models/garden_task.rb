class GardenTask < ActiveRecord::Base
	validates :description, presence: true
	validates :date, presence: true

	def self.new_date(original_date, days_away)
		date = original_date.to_date
	  (date + days_away.to_i).to_s
	end

end
