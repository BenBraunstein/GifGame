Rails.application.routes.draw do
  resources :users do
    resources :games, only: [:index, :show, :new, :create]
  end

  get "gifs/search/", to: "gifs#search"

  get "gifs/question", to: "gifs#question"

  post "gifs/search/", to: "gifs#results"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
 