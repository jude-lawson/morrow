Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      post '/users', to: 'users#create'
      get '/users', to: 'users#index'
    end
  end

end
