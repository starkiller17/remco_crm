Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'sessions#new'

  # Get routes
  get 'home', to: 'welcome#index'
  get 'empresas', to: 'empresas#index'
  get 'entregas', to: 'entregas#index'
  get 'clientes', to: 'clientes#index'
  get 'facturacion', to: 'facturacion#index'
  get 'direcciones', to: 'direcciones#index'
  get 'llamadas', to: 'llamadas#index'


  get 'signup', to: 'users#new'
  
  # Session routes
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users, except: [:new]
  resources :categories, except: [:destroy]
end
