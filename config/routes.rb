Reddit::Application.routes.draw do
  
  resources :votes do
    get 'up', :on => :member
    get 'down', :on => :member
    get 'remove', :on => :member
  end

  resources :links

  devise_for :users

  root :to => "homepage#index"
end
