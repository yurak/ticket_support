Rails.application.routes.draw do

  devise_for :users

  resources :tickets do
    resources :comments
    member do
      get 'edit_status'
      put 'update_status'
      get 'assign_to_user'
      put 'update_assign_to_user'
    end
  end
  root :to => 'tickets#new'
end
