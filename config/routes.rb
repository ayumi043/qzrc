Qzrc::Application.routes.draw do


  get "search/index"

  resources :companys
  resources :posts
  resources :jobs
  get 'search/company' => 'search#company'
  resources :search

  # namespace :admin do
  #   resources :events
  # end


  match "jobs/:year/:month", to: "jobs#archive", :as => "job_archive"   
  #以下是rails 2的写法
  #map.job_archive 'jobs/:year/:month', :controller => 'jobs', :action => 'archive'


  match "/acount/new", to: "sessions#new"
  match "/auth/:provider/callback", to: "sessions#create"
  match "/auth/failure", to: "sessions#failure"
  match "/auth/:provider/failure", to: "sessions#new"
  match "/logout", to: "sessions#destroy", :as => "logout"
  resources :identities
  

  match 'c/:id/' => 'companys#show', :as => :show
  get 'c/' => 'companys#index'

  get "home/index" 

  
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
  # root :to => 'welcome#index'
  # root :to => 'home#index'
  root :to => 'jobs#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
