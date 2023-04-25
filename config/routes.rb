Rails.application.routes.draw do
  devise_for :users
  resources :job_listings
  resources :experiences do
    resources :ai_messages
  end
  root "application#root"
end
