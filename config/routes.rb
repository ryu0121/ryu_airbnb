Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, path: '',
  path_names: { sign_in: 'login', sign_up: 'registration', sign_out: 'logout' },
  controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }
  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :rooms, execpt: [:edit] do
    member do
      get 'listing'
      get 'pricing'
      get 'description'
      get 'photo_upload'
      get 'amenities'
      get 'location'
    end
    resources :photos, only: [:create, :destroy]
    resources :reservations, only: [:create]
  end
end