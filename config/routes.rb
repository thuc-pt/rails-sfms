Rails.application.routes.draw do
  root "home#index"

  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  resources :users, only: [:show, :edit, :update] do
    patch :update_avatar, on: :member
  end
  resources :pitches do
    get :toggle_activation, on: :member
    resources :sub_pitches, except: [:show, :new]
    resources :owner_bookings, except: [:show, :edit] do
      get :edit_infor, on: :collection
      get :change_date, on: :collection
    end
  end
  resources :timesheets, except: [:index, :show, :new]
  get "home", to: "home#index"
  get "list_pitches_by_province", to: "home#list_pitches_by_province"
  get "list_pitches_by_district", to: "home#list_pitches_by_district"
  resources :bookings, except: [:index, :show, :edit] do
    get :confirm_request, on: :member
    get :audit_conditions, on: :collection
  end
  resources :booking_requests, only: :index do
    get :list_booking_by_params, on: :collection
  end
  resources :booking_histories, only: [:index, :destroy]
  resources :teams do
    resources :posts, except: [:index, :show, :new]
  end
  resources :comments, except: [:index, :show]
end
