Rails.application.routes.draw do
  root "home#index"

  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  resources :users, only: [:show, :edit, :update] do
    patch :update_avatar, on: :member
  end
end
