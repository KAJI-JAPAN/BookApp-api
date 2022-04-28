Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :posts
      resources :post_items
      resources :guests, only: [:create]
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations',
        passwords: 'api/v1/auth/passwords'
      }

      devise_scope :api_v1_user do
        post 'auth/guest_sign_in', to: 'auth/sessions#guest_sign_in'
      end

      resources :get_books do
        post :search_books, on: :collection
      end

      resources :schedules do
        post :create_many_schedule, on: :collection
        post :delete_many_schedule, on: :member
      end

    end
  end
end
