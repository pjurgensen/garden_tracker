class GardenTasksController < ApplicationController
	def index
		@garden_tasks = GardenTask.all
		@today_tasks = GardenTask.where(date: Date.today)
		@future_tasks = GardenTask.where(['date > ?', Date.today]).order('date DESC')
		@past_tasks = GardenTask.where(['date < ?', Date.today]).order('date DESC')
	end

	def new
		@garden_task = GardenTask.new
	end

	def create
		@garden_task = GardenTask.create(garden_task_params)

		if params[:days_away] && params[:future_description] != nil
			days_away = params[:days_away]
			future_date = GardenTask.new_date(params[:garden_task][:date], days_away)
			puts "Future date: " + future_date
			@future_task = GardenTask.create(date: future_date, description: params[:future_description])
			future_task_okay = true
		else
			future_task_okay = true
		end

		if @garden_task.save && future_task_okay
			flash[:notice] = "Your task was created"
			redirect_to garden_tasks_path
		else
			flash[:alert] = "Your task was not saved - try again"
			render 'new'
		end
	end

private

  def garden_task_params
    params.require(:garden_task).permit(:date, :description)
  end
end
