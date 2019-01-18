Rails.application.routes.draw do
  constraints Clearance::Constraints::SignedIn.new do
    root to: 'dashboards#show'
  end
  root to: 'homes#show'

  resources :shouts, only: %w[create show]
  resources :passwords, controller: "clearance/passwords", only: %w[create new]
  resource :session, only: :create

  resources :users, only: %w[create show] do
    resource :password, controller: "clearance/passwords", only: %w[create edit update]
  end

  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"
end
