Blog::Application.routes.draw do
  devise_for :users
  get "welcome/index"

  resources :articles do
    resources :comments  
  end

  get "/tags", to: "articles#getTags"
  
  get "/admin", to: "admin#admin"

  root 'welcome#index'
end
