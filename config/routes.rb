Rails.application.routes.draw do
  # get 'movies/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "pages#home"
  resources :movies, only: [:index, :show] do
    resources :bookmarks, only: [:create]
  end

end
