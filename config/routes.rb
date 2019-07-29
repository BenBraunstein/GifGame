Rails.application.routes.draw do
  get 'gifs/search/', to: "gifs#search"
  
  post 'gifs/search/', to: "gifs#results"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
