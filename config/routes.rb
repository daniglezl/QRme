Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'statics#home'

  as :user do
    # sessions
    get 'login', to: 'devise/sessions#new', as: :new_user_session
    post 'login', to: 'devise/sessions#create', as: :user_session
    delete 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session

    #registrations
    get 'users/cancel', to: 'devise/registrations#cancel', as: :cancel_user_registration
    get :signup, to: 'devise/registrations#new', as: :new_user_registration
    get :profile, to: 'devise/registrations#edit', as: :edit_user_registration
    patch :profile, to: 'devise_custom/registrations#update', as: :update_user_registration
  end
  devise_for :users, skip: [:sessions], controllers: { registrations: 'devise_custom/registrations' }

  get :dashboard, to: 'dashboard#index', as: :dashboard_index

  resources :events
  resources :event_instances, only: :destroy
  resources :polls
  resources :forum_threads
end
