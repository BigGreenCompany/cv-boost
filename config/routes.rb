Rails.application.routes.draw do
  authenticate :user, ->(user) { user.has_role? :admin } do
    mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  end
  devise_for :users
  resources :job_listings
  resources :experiences do
    resources :ai_messages
  end
  root "application#root"
end
