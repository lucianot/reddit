Reddit::Application.routes.draw do
  devise_for :users

  root :to => "homepage#index"
end
