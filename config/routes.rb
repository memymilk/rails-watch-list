Rails.application.routes.draw do
  # get 'movies/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "lists#index"
  resources :lists, only: [:create, :new, :show] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: :destroy
  # root to: "pages#home"
  # resources :movies, only: [:index, :show] do
  #   resources :bookmarks, only: [:create]
  # end
end
