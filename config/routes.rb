Reddit::Application.routes.draw do
  resources :links

  devise_for :users

  root :to => "homepage#index"
end
