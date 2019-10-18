Rails.application.routes.draw do
  namespace :api do
    resources :dog_walkings
  end
end
