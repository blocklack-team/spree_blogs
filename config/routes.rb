Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :blogs
    resources :posts
  end

  resources :blogs, only: [:show] do
    get "/tagged/:tag" => "blogs#tag", :as => :tag
    get "/:id" => "posts#show", :as => :post
  end

  namespace :api, defaults: { format: 'json' } do
    resources :posts, only: [:show] do
      get "/:id" => "articles#show", :as => :post
    end
  end
end
