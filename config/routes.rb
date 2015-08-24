Rails.application.routes.draw do
  get 'home/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'characters#index'

  resources :characters
  resources :chronicles

  get 'register', to: 'users#new'
  post 'register', to: 'users#create'
  get 'login', to: 'session#login', as: :login
  post 'login', to: 'session#new'
  get 'logout', to: 'session#destroy', as: :logout
  get 'settings', to: 'users#edit', as: :edit_user
  post 'settings', to: 'users#update'
  get 'forgot_password', to: 'session#forgot_password', as: :forgot_password
  post 'reset_password', to: 'session#reset_password', as: :reset_password

  get 'admin', to: 'admin#index'

  get 'chronicles/:id/print_all', to: 'chronicles#print_all', as: :print_all

  namespace :admin do
    resources :character_types
    resources :attributes
    resources :skills
    resources :lineages
    resources :powers
    resources :power_types
    resources :skill_categories
    resources :attribute_categories
    resources :affiliations
    resources :merits
  end


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
