Rails.application.routes.draw do
  root "home#index"

  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  resources :users, only: [:show, :edit, :update] do
    patch :update_avatar, on: :member
  end
  resources :pitches do
    get :toggle_activation, on: :member
    resources :sub_pitches, except: [:show, :new]
  end
  resources :timesheets, except: [:index, :show, :new]
end
