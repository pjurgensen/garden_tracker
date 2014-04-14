class GardenTasksController < ApplicationController
	def index
		@garden_tasks = GardenTask.all
	end
end