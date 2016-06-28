Rails.application.routes.draw do
  get 'blogs/index'

  resources :blogs

  root to: "blogs#index"

end
