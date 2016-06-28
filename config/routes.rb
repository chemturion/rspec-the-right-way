Rails.application.routes.draw do
  get 'blogs/index'

  resources :blog

  root to: "blogs#index"

end
