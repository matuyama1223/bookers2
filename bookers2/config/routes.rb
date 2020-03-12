Rails.application.routes.draw do
  root :to  => 'top#index'
  devise_for :users
  get 'home/about'=>"top#about"
  # get 'top/index'
  # get 'users/index'
  # get 'users/show'
  # get 'users/edit'
  # post 'todolists'=>'todolists#create'
  # get'todolists'=>'todolists#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# resources :books,only:[:new,:create,:index,:show]
resources :users
resources :books,only:[:index,:new,:create,:show,:destroy,:edit,:update]


end
