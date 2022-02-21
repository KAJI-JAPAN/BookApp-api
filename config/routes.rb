Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :posts
      resources :post_items
      resources :schedules
    end
  end
end
