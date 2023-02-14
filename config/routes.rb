Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  #ネストを使用した記述
  resources :items do
    resources :orders, only: [:index, :create]
  end
end
