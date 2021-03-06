Rails.application.routes.draw do
  get 'welcome/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  resources :players
  resources :tournaments do
    resources :teams, :rounds
    resources :tournament_players, :only => [:edit, :update, :destroy]
  end
  resources :courses do
    resources :tee_boxes
  end

  get 'tournaments/:id/add_tournament_players', to: 'tournaments#add_tournament_players', as: :add_tournament_players
  post 'tournaments/:id/save_tournament_players', to: 'tournaments#save_tournament_players', as: :save_tournament_players

  get 'tournaments/:tournament_id/teams/:team_id/add_team_players', to: 'teams#add_team_players', as: :add_team_players
  post 'tournaments/:tournament_id/teams/:team_id/save_team_players', to: 'teams#save_team_players', as: :save_team_players

  get 'tournaments/:tournament_id/select_course_for_tournament_round', to: 'tournaments#select_course_for_tournament_round', as: :select_course_for_tournament_round

  get 'tournaments/:tournament_id/rounds/:id/change_course_for_tournament_round', to: 'rounds#change_course_for_tournament_round', as: :change_course_for_tournament_round

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
