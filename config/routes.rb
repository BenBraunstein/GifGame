Rails.application.routes.draw do
  

  namespace :question do
    resources :syns, only: [:index, :show, :new, :destroy, :create]
    resources :dogs, only: [:index, :show, :new, :destroy, :create]
    resources :movs, only: [:index, :show, :new, :destroy, :create]
    resources :mats, only: [:index, :show, :new, :destroy, :create]
  end

  get '/question', to: "questions#analytics"


  resources :users do
    resources :games, only: [:index, :show, :new, :create]
  end


  post '/users/:user_id/games/form/:form_id', to: 'games#create_with_form', as: 'create_user_game_with_form'

  post '/users/:user_id/games/:game_id', to: 'games#answers'

  

  

  get "gifs/search/", to: "gifs#search"

  get "gifs/question", to: "gifs#question"

  post "gifs/search/", to: "gifs#results"
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
 