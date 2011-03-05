Reddit::Application.routes.draw do
  
  resources :votes do
    post 'up', :on => :member
    post 'down', :on => :member
    post 'remove', :on => :member
  end

  resources :links

  devise_for :users

  root :to => "homepage#index"
end
