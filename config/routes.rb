Rails.application.routes.draw do
  get 'search/search'
  get 'search/searching'
  get 'chats/show'
  get 'users/show'
  get 'users/index'
  get 'users/edit'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
  get 'chat/:id' => 'chats#show', as: 'chat'
  get '/post/hashtag/:name', to: "posts#hashtag", as: 'hashtag'
  resources :chats, only: [:create]
  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :index, :edit, :update] do
    member do
      get :followings, :followers
    end
  end
end