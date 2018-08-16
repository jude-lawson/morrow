Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # Users
      post '/users', to: 'users#create'

      # Tasks
      get '/users/:id/tasks', to: 'users/tasks#index'
    end
  end
end
