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
  get 'chronicles/:id/xp_records', to: 'chronicles#xp_records', as: :xp_records
  get 'chronicles/:id/xp_records/new', to: 'chronicles#new_xp_record', as: :new_xp_record
  get 'chronicles/:id/xp_records/new_multiple', to: 'chronicles#new_xp_records', as: :new_xp_records
  post 'chronicles/:id/xp_records/new', to: 'chronicles#create_xp_record', as: :create_xp_record
  post 'chronicles/:id/xp_records/new_multiple', to: 'chronicles#create_xp_records', as: :create_xp_records
  delete 'chronicles/:id/xp_records/:xp_record_id', to: 'chronicles#destroy_xp_record', as: :destroy_xp_record

  get 'chronicles/:id/game/:game_id/downtime_actions/print_all', to: 'chronicles#print_downtime_actions', as: :print_downtime_actions
  get 'chronicles/:id/game/:game_id/downtime_actions', to: 'chronicles#downtime_actions', as: :downtime_actions
  get 'chronicles/:id/game/:game_id/downtime_actions/:downtime_action_id', to: 'chronicles#show_downtime_action', as: :show_downtime_action
  post 'chronicles/:id/game/:game_id/downtime_actions/:downtime_action_id', to: 'chronicles#process_downtime_action', as: :process_downtime_action

  get 'chronicles/:id/games', to: 'chronicles#games', as: :games
  get 'chronicles/:id/games/new', to: 'chronicles#new_game', as: :new_game
  post 'chronicles/:id/game/new', to: 'chronicles#create_game', as: :create_game
  get 'chronicles/:id/game/:game_id/edit', to: 'chronicles#edit_game', as: :edit_game
  post 'chronicles/:id/game/:game_id/edit', to: 'chronicles#update_game', as: :update_game
  delete 'chronicles/:id/game/:game_id', to: 'chronicles#destroy_game', as: :destroy_game

  get 'characters/:id/downtime_actions', to: 'characters#downtime_actions', as: :character_downtime_actions
  get 'characters/:id/downtime_action/new', to: 'characters#new_downtime_action', as: :character_new_downtime_action
  get 'characters/:id/downtime_action/:downtime_action_id', to: 'characters#downtime_action', as: :character_downtime_action
  get 'characters/:id/downtime_action/:downtime_action_id/edit', to: 'characters#edit_downtime_action', as: :character_edit_downtime_action
  post 'characters/:id/downtime_action/new', to: 'characters#create_downtime_action', as: :character_create_downtime_action
  post 'characters/:id/downtime_action/:downtime_action_id/edit', to: 'characters#update_downtime_action', as: :character_update_downtime_action
  delete 'characters/:id/downtime_action/:downtime_action_id', to: 'characters#destroy_downtime_action', as: :character_destroy_downtime_action

  namespace :admin do
    resources :character_types
    resources :attributes
    resources :skills
    resources :lineages
    resources :powers
    resources :power_types
    resources :skill_categories
    resources :affiliations
    resources :merits
    resources :flaws
  end
end
