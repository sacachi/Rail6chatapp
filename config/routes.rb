Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  root 'landing#index'
  get 'landing/index'
  resources :messages, only: [:new, :create]
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
