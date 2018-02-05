Rails.application.routes.draw do
  
  resources :profile_reviews
  resources :poor_reviews
  resources :profile_links
  resources :links
  resources :invites
  #resources :review_statuses
  #resources :purchases, only: [:show]


  get 'business/review' => 'businesses#index'

  get 'business/reporting' => 'reports#index' 

  get 'business/:business_name' => 'users#page'

  get 'paqs/pay'

  get 'paqs/how1'

  get 'paqs/how2'

  get 'paqs/how3'

  get 'paqs/how4'

  get 'paqs/how5'

  get 'paqs/how6'

  get 'paqs/how7'

  get 'profile_reviews/index'
 
  get 'profile_links/:lid/create' => 'profile_links#new'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: "registrations" }
  #devise_for :users, controllers: { confirmations: 'confirmations' }

  resources :products
  resources :charges
  resources :plans
  resources :schedules 
  
  resources :subscriptions
  #get 'subscriptions/:id/pay' => 'subscriptions#pay'

  #get 'subscriptions/:sid/pay' => 'subscriptions#pay'
    #get '/schedules/:id/pay' => 'subscriptions#pay'
    #get 'subscriptions/:id/scheduled' => ''

  #get 'users/signout' => 'devise/sessions#destroy'

  get 'subscriptions/pay' => 'subscriptions#pay'

    #match 'subscriptions/:id/pay' => 'subscriptions#pay', via: [:get, :post], :as => :subpay
  devise_scope :user do 
     match 'users/acct_setting' => 'registrations#acct_setting', :via => [:get], :as => 'acct_setting'
  end 

resource :user, only: [:edit] do
    collection do
      patch 'update_password'
  end
end

  get 'widgets/index'

  get 'companies/about'

  get 'companies/contact'

  get 'companies/:cname/review' => 'companies#index'

  get 'companies/spotberry'

  get 'companies/new'

  get 'companies/reviewssos/howto/intro' => 'companies#intro'

  get 'companies/reviewssos/howto/intro2' => 'companies#intro2'

  get 'companies/reviewssos/howto/intro3' => 'companies#intro3'

  get 'invites/index'

  get 'orders/:oid/deliveries' => 'deliveries#new'

  match 'users/:id' => 'users#show', via: :get

  #get 'users/:id' => 'users#show'

  resources :users, only: [:show]

  get '/unlock/', :to => "users#unlock", as: 'unlock_url'

  # resources :users, only: [:show] do
  #   member do 
  #     get :confirm_mail
  #   end
  # end

  #get 'orders#index'

  #root 'deliveries#index'

  root 'users#index'
  #root 'pages#about'
  get 'users/password/edit' => 'devise/passwords#edit'

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
