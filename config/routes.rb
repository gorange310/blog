Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'

  resources :posts do
    member do
      post :create  # /cards/2/like
    end

    resources :comments, shallow: true,
               except: [:index, :show, :new]
  end

  resources :users, except: [:new]
  get 'signup', to: 'users#new'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end