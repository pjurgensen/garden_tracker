class GardenTasksController < ApplicationController
	def index
		@garden_tasks = GardenTask.all
	end

	def new
		@garden_task = GardenTask.new
	end

	def create
		@garden_task = GardenTask.create(garden_task_params)
		if @garden_task.save
			flash[:notice] = "Your task was created"
			redirect_to garden_tasks_path
		else
			flash[:alert] = "Your task was not saved - try again"
			render 'new'
		end
	end

private

  def garden_task_params
    params.require(:garden_task).permit(:description, :date)
  end
end
