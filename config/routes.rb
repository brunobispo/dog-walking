Rails.application.routes.draw do
  namespace :api do
    resources :dog_walkings do
      member do
        patch :start_walk
        patch :finish_walk
      end
    end
  end
end
