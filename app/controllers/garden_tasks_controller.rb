class GardenTasksController < ApplicationController
	def index
		@garden_tasks = GardenTask.all
		@today_tasks = GardenTask.where(date: Date.today)
		@future_tasks = GardenTask.where(['date > ?', Date.today]).order('date DESC')
		@past_tasks = GardenTask.where(['date < ?', Date.today]).order('date DESC')
		@search = params[:query]
		if @search == nil
			render 'index'
		else
			@search_results = GardenTask.basic_search(@search)
			render 'search'
		end
	end

	def search
		@search_results = GardenTask.basic_search(@search)
	end

	def new
		@garden_task = GardenTask.new
	end

	def create
		@garden_task = GardenTask.create(garden_task_params)
		@user = User.find(params[:id])

		if params[:days_away] && params[:future_description] != (nil || "")
			days_away = params[:days_away]
			future_date = GardenTask.new_date(params[:garden_task][:date], days_away)
			@future_task = GardenTask.create(date: future_date, description: params[:future_description])
			future_task_okay = @future_task.save
		else
			future_task_okay = true
		end

		if @garden_task.save && future_task_okay
			# task_created_email(@user)
			flash[:notice] = "Your task was created!"
			redirect_to garden_tasks_path
		else
			flash[:alert] = "Your task was not saved - try again"
			render 'new'
		end
	end

	def edit
		@garden_task = GardenTask.find(params[:id])
	end

	def update
		@garden_task = GardenTask.find(params[:id])

		if params[:days_away] && params[:future_description] != (nil || "")
			days_away = params[:days_away]
			future_date = GardenTask.new_date(params[:garden_task][:date], days_away)
			@future_task = GardenTask.create(date: future_date, description: params[:future_description])
			future_task_okay = @future_task.save
		else
			future_task_okay = true
		end

		if @garden_task.update(garden_task_params) && future_task_okay
			flash[:notice] = "Your task was updated"
			redirect_to garden_tasks_path
		else
			flash[:alert] = "Your task was not saved - try again"
			render 'edit'
		end
	end

	def destroy
		@garden_task = GardenTask.find(params[:id])
		@garden_task.destroy
		redirect_to root_path, notice: "Garden task has been deleted!"
	end

private

  def garden_task_params
    params.require(:garden_task).permit(:date, :description, :completed)
  end
end
