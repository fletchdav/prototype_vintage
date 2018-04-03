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
  get 'element_up/:id', to: 'elements#up', as: :element_up
  get 'element_down/:id', to: 'elements#down', as: :element_down
  get 'activity_up/:id', to: 'activities#up', as: :activity_up
  get 'activity_down/:id', to: 'activities#down', as: :activity_down

  resources :activities do
    resources :elements
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
