Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :articles, only: [:index, :show]
  resources :lists do
    resources :articles
  end
  resources :shoots, only: :index
  resources :shootings do
    resources :shoots
  end
  get 'about', to: 'pages#about', as: :about
  get 'contact', to: 'pages#contact', as: :contact
  get 'up/:id', to: 'articles#up', as: :up
  get 'down/:id', to: 'articles#down', as: :down
  get 'show_up/:id', to: 'lists#show_up', as: :show_up
  get 'show_down/:id', to: 'lists#show_down', as: :show_down

  resources :activities do
    resources :elements
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
