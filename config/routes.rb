Rails.application.routes.draw do

  root 'sessions#main_page'

  resources :attractions

  resources :rides do
    collection do
      post '/', to: 'rides#create'
    end
  end

  resources :users

  resources :sessions

  get '/signin', to: 'sessions#signin'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destory'

end