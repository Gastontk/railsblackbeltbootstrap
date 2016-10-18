Rails.application.routes.draw do
  get 'orgs/new'

  get 'orgs/create'

  get 'orgs/edit'

  get 'orgs/update'

  get 'orgs/index'

  get 'orgs/show'

  get 'orgs/destroy'
  get '/main' => 'orgs#index'

  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :orgs


  get 'session/new'

  get 'session/create'

  get 'session/destroy'

  
  get 'users/new'

  get 'users/create'

  get 'users/index'

  get 'users/show'

  get 'users/edit'
# Added root signup and login routes needed
  root 'users#new'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/users' => 'users#create'
  get '/logout' => 'sessions#destroy'
  get '/users' => 'users#new'
  post '/add_group_to_user' => 'orgs#add_group_to_user'
  post '/delete_group_from_user' => 'orgs#delete_group_from_user'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
