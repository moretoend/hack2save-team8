Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "callbacks", registrations: "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :organizations

  namespace :user do
    resources :subscriptions, only:[:index, :new, :create] do
      member do
        put 'abandon'
      end
    end
  end

  scope 'jobs' do
    get 'search', to: 'jobs#search', as: 'jobs_search'
  end

  resources :organizations do
    resources :jobs
  end
end

