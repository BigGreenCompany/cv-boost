Rails.application.routes.draw do
  devise_for :users
  resources :experiences do
    resources :ai_messages
  end
  root "application#root"
end
