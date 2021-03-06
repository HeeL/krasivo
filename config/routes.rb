Krasivo::Application.routes.draw do

  namespace :b2b do
    match 'food' => 'b2b#food'
    match 'portfolio' => 'b2b#portfolio'
    match 'catering' => 'b2b#catering'
    match 'price' => 'b2b#price'
    match 'contacts' => 'b2b#contacts'
  end

  resources :line_items
  resources :events


  resources :carts
  
  resources :appointments


  devise_for :users, :controllers => { sessions: 'sessions' }

  get "orders/create"

  resources :recipes
  resources :orders

  mount Ckeditor::Engine => '/ckeditor'
  
  # Events
  match 'events/:id' => 'events#show', :as => :event
  match 'future' => 'events#future', :as => :future_events
  match 'past' => 'events#past', :as => :past_events
  
  # Blog
  match 'blog' => 'articles#index', :as => :blog
  match 'blog/:id' => 'articles#show', :as => :article
  
  # Static Pages
  match '/contacts' => 'static_pages#contacts'
  match '/school' => 'static_pages#school'
  match '/services' => 'static_pages#services'

  root :to => 'static_pages#home'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end