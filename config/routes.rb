Rails.application.routes.draw do
  devise_for :users

  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # ADMIN ROUTES
  get 'admin/user' => 'users#new', as: :users
  get 'admin/' => 'articles#dashboard', as: :admin
  post 'admin/create' => 'articles#create', as: :create_article
  put 'admin/update' => 'articles#update', as: :update_article

  get 'admin/:type/paginate/:page' => 'articles#paginate', as: :paginate
  get 'admin/:type/new' => 'articles#new', as: :new_article

  get 'admin/:id/show' => 'articles#show', as: :show_article
  get 'admin/:id/edit' => 'articles#edit', as: :edit_article
  delete 'admin/:id/remove' => 'articles#destroy', as: :remove_article

  get 'information' => 'articles#contact', as: :information

  #MAIN ROUTES
  root 'articles#home'
  get ':type/:classification' => 'articles#index', as: :index
  get 'recipes/:id/show' => 'recipes#show', as: :show_recipe
  get 'bars' => 'articles#bars', as: :bars
  get 'scroll' => 'articles#scroll', as: :scroll



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
