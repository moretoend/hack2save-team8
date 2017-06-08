Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "callbacks", registrations: "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :organizations
  resources :user, only:[] do
    resources :subscriptions
  end
end

