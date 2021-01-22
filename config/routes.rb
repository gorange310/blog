Rails.application.routes.draw do
  root 'pages#home'
  # get 'about', to: 'pages#about'

  resources :posts do
    collection do
      get :search  # /posts/search
    end
    resources :comments, shallow: true,
              except: [:index, :show, :new]
  end

  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :categories, except: [:destroy]
end