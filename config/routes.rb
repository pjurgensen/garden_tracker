GardenTracker::Application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  root to: "garden_tasks#index"

  resources :garden_tasks
  resources :users
  resources :sessions
end
