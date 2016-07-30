Rails.application.routes.draw do
  get 'movies/search'
  get 'movies/search_movie'


  resources :movies

  
  
  root 'movies#search'

  
end
