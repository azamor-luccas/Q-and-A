Rails.application.routes.draw do

  resources :users, only: [:create]

  get 'questions/popular'
  resources :questions, only: [:index, :show, :create], shallow: true do
    resources :answers, only: [:create]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
