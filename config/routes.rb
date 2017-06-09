Rails.application.routes.draw do
  get 'subscriptions/accept/:id/:user_id', to: 'subscriptions#accept'
  get 'subscriptions/decline/:id/:user_id', to: 'subscriptions#decline'
  get 'subscriptions/destroy/:id/:user_id', to: 'subscriptions#destroy'

  devise_for :users, controllers: { omniauth_callbacks: "callbacks", registrations: "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :organizations do
    resources :jobs do
      resources :subscriptions
    end
  end

end
