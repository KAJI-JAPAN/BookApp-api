Rails.application.routes.draw do
Rails.application.routes.default_url_options[:host] = ENV["API_DOMAIN"]

  namespace :api do
    namespace :v1 do
      resources :posts, except: [:update]
      resources :post_items, only: [:update, :destroy]
      resources :guests, only: [:create, :update]

      namespace :auth do
        resource :passwords, only: [:create, :update]
      end
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations'
        # passwords: 'api/v1/auth/passwords'
      }

      resources :get_books do
        post :search_books, on: :collection
      end

      devise_scope :user do
        post 'auth/guest_sign_in', to: 'auth/sessions#guest_sign_in'
      end

      resources :schedules do
        post :create_many_schedule, on: :collection
        post :delete_many_schedule, on: :member
      end

    end
  end
end
