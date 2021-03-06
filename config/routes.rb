Rails.application.routes.draw do
  
  post "relationships/:followed_id/create" => "relationships#create"
  post "relationships/:followed_id/destroy" => "relationships#destroy"
  
  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"
  get "users/:id/likes" => "users#likes"
  
  get "users/:id/home" => "users#home"
  get "users/:id/following" => "users#following"
  get "users/:id/followers" => "users#followers"
  
  
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "login" => "users#login_form"
  
  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"
  get "signup" => "users#new"
  get 'users/index' => "users#index"
  get "users/:id" => "users#show"
  
  get '/' => "home#top"
  get "about" => "home#about"
  
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
  get "posts/:id" => "posts#show"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
