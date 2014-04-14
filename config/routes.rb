GardenTracker::Application.routes.draw do
  root to: "garden_tasks#index"

  resources :garden_tasks

end
