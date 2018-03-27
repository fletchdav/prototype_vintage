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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
