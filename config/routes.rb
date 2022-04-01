Rails.application.routes.draw do
  get 'longterm_schedules/create'
  namespace :api do
    namespace :v1 do
      resources :posts
      resources :post_items

      resources :schedules do
        collection do
          post :create_many_schedule
        end
        member do
          post :delete_many_schedule
        end
      end

    end
  end
end
