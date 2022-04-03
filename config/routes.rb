Rails.application.routes.draw do
  get 'longterm_schedules/create'
  namespace :api do
    namespace :v1 do
      resources :posts
      resources :post_items

      resources :schedules do
        post :create_many_schedule, on: :collection
        post :delete_many_schedule, on: :member
      end

    end
  end
end
