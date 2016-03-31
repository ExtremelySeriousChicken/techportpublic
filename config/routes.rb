Rails.application.routes.draw do
  resources :users
  post '/users/'  => 'users#create'

  post '/auth/sign_in' => 'sessions#create'
  post '/test_receive' => 'tests#receive'
  post '/test_send' => 'test#send'
  # post '/test_voice', to: 'test#voice'
  # get '/test_receive' => 'test#receive'
  # get '/test_send' => 'test#send'

  #This is for the auth
  delete '/auth/logout', to: 'sessions#destroy'

  #This is to get the item
  get '/item/', to: 'item#index'
  get '/item/:id', to: 'item#show'

  #Thisis to get the list of stores
  get '/store/', to: 'store#index'
  get '/store/:id', to: 'store#show'

  post '/cart/add_one', to: 'cart#add_one'
  post '/cart/add', to: 'cart#add'
  delete '/cart/remove', to: 'cart#remove'
  delete '/cart/clear', to: 'cart#clear'

  get 'cart/me', to: 'cart#mycart'

  post '/order/create', to: 'order#create'
  delete '/order/destroy', to: 'order#destroy'
  get '/order/get', to: 'order#getRequest'
  put '/order/accept', to: 'order#acceptRequest'
  put  '/order/cancel', to: 'order#cancelRequest'
  put  '/order/sent', to: 'order#sentRequest'
  get  '/order/pending', to: 'order#myPending'
  get  '/order/history', to: 'order#myHistory'
  get '/order/', to: 'order#index'
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
