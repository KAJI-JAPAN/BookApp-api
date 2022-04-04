Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
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
