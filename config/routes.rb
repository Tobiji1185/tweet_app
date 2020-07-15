Rails.application.routes.draw do
  get "/" => "home#top"
  get "about" => "home#about"
  # routeにダッシュボードのリンクをおく
  get "company" => "company#company"
  
  get "users/index" => "users#index"

  get "users/:id/"  => "users#show"

  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
  

end
