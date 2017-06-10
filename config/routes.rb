Rails.application.routes.draw do
  get 'subscriptions/accept/:id/:user_id', to: 'subscriptions#accept'
  get 'subscriptions/decline/:id/:user_id', to: 'subscriptions#decline'
  get 'subscriptions/destroy/:id/:user_id', to: 'subscriptions#destroy'

  devise_for :users, controllers: { omniauth_callbacks: "callbacks", registrations: "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :users, only: :show

  resources :organizations do
    resources :jobs do
      resources :subscriptions, only: :index
    end
  end

  resources :subscriptions, only: [] do
    member do
      get :accept
      get :decline
      get :cancel
      get :close
    end
  end

  resources :jobs_filters, only: :index

  resources :user_subscriptions, only: [:index, :new, :create] do
    put :abandon, on: :member
  end

  resources :user_reviews, only: [:edit, :update]
  resources :organization_reviews, only: [:edit, :update]

end
