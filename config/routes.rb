Blog::Application.routes.draw do
  get "welcome/index"

  resources :articles do
    resources :comments  
  end

  get "/tags", to: "articles#getTags"

  root 'welcome#index'
end
