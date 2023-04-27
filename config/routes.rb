Rails.application.routes.draw do
  authenticate :user, ->(user) { user.has_role? :admin } do
    mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  end

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  resources :job_listings
  resources :experiences do
    resources :ai_messages
  end

  get 'omniauth_callbacks/linkedin'

  root "application#root"
end
