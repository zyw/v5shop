Rails.application.routes.draw do

  # 内容分类管理
  resources :content_classifies

  # 内容管理
  resources :contents

  post 'content/pics/upload' => 'contents#picsUpload',as:'pics_upload'

  post 'content/cattas/upload' => 'contents#cattasUpload',as:'cattas_upload'

  # 导航管理
  get 'navs/json' => 'navs#tree_json', as: 'navs_json'

  resources :navs

  #行政区划管理
  resources :admin_divisions

  #服务地址管理
  resources :addresses

  # 产品信息
  resources :products

  post 'product/picture/upload' => 'products#pictureUpload'
  get 'product/list' => 'products#list', as: 'product_list'
  get 'product/list/:pcid' => 'products#list',as: 'product_list_s'

  # 产品分类
  resources :product_classifies

  # 字典
  resources :dicts

  # 字典类型
  resources :dict_types

  # 会员
  get 'users/login' => 'users#login', as: 'user_login'

  get 'users/logout' => 'users#logout',as: 'user_logout'

  post 'users/login_post' => 'users#loginPost', as: 'user_login_post'

  get 'users/register' => 'users#register', as: 'user_register'

  post 'users/reg_post' => 'users#regPost', as: 'user_register_post'

  resources :users

  # 管理员
  get 'managers/login',as:'manager_login'

  get 'managers/logout',as: 'manager_logout'

  post 'managers/login_post' => 'managers#loginPost', as: 'manager_login_post'

  post 'managers/reset_pwd' => 'managers#resetPassword',as: 'manager_reset_pwd'

  resources :managers

  # 后台首页
  get 'admins/index'

  get 'admins/show'

  get 'admins/new'

  # 购物车
  get 'carts/index' => 'carts#index',as: 'carts_list'
  get 'carts/add/:id' => 'carts#add',as: 'cart_add'
  get 'carts/remove' => 'carts#remove',as: 'cart_remove'

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
