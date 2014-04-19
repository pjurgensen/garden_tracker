class GardenTask < ActiveRecord::Base
	validates :description, presence: true
	validates :date, presence: true

end
