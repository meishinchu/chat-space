Rails.application.routes.draw do
  devise_for :users
  root  'messages#index'
  get   'users/:id/edit'   =>  'users#edit'
end
