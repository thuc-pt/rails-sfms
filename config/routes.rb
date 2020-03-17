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
  get "home", to: "home#index"
  get "list_pitches_by_province", to: "home#list_pitches_by_province"
  get "list_pitches_by_district", to: "home#list_pitches_by_district"
  resources :bookings, except: [:show, :new, :edit] do
    get :confirm_request, on: :member
  end
  resources :booking_requests, only: :index do
    get :list_booking_by_params, on: :collection
  end
end
