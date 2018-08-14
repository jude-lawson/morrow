Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      # Users
      post '/users', to: 'users#create'
      get '/users', to: 'users#index'

      # Tasks
      post '/tasks', to: 'tasks#create'
    end
  end

end
