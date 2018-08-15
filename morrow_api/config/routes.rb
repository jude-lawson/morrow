Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # Tasks
      get '/users/:id/tasks', to: 'users/tasks#index'
    end
  end
end
