Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :posts, only:[:index, :create]
      
        namespace :post_items do
        resources :posts 
        end
      end
   end
end
