require 'api_constraints'

Rails.application.routes.draw do
  resources :poll_answers
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'user_token' => 'user_token#create'

  root to: 'statics#home'

  as :user do
    # sessions
    get     'login',  to: 'devise/sessions#new',      as: :new_user_session
    post    'login',  to: 'devise/sessions#create',   as: :user_session
    delete  'logout', to: 'devise/sessions#destroy',  as: :destroy_user_session

    #registrations
    get   'users/cancel', to: 'devise/registrations#cancel',        as: :cancel_user_registration
    get   :signup,        to: 'devise/registrations#new',           as: :new_user_registration
    get   :profile,       to: 'devise/registrations#edit',          as: :edit_user_registration
    patch :profile,       to: 'devise_custom/registrations#update', as: :update_user_registration
  end
  devise_for :users, skip: [:sessions], controllers: { registrations: 'devise_custom/registrations' }


  get '/dashboard' , to: 'dashboard#index'
  get :dashboard, to: 'dashboard#index', as: :dashboard_index


 # get '/events/invite_event' , to: 'events#invite_event'
  get '/events/uninvite_event' , to: 'events#uninvite_event'
  get '/events/invite_app' , to: 'events#invite_app'
  get '/events/accept_event/:id' , to: 'events#accept_event'

  get '/events/qrcode/:id', to: 'events#qrcode', as: 'qrcode_event'
  get '/event_instances/qrcode/:id', to: 'event_instances#qrcode', as: 'qrcode_event_instance'
  post '/attendances/attended/', to: 'attendances#attended', as: 'attendances_attended'
  get '/attendances/doneattendance/', to: 'attendances#doneattendance', as: 'attendances_doneattendance'

  resources :events
  resources :event_instances, only: :destroy

  resources :events do
    member do
      get   :invite_event
      post  :invite_event_errors
      post  :accept_invitation_event
      post  :invite_app_action
      delete  :remove_invite
      delete   :leave_event
    end
  end
  resources :event_instances
  resources :polls do
    member do
      get :vote
    end
  end
  resources :forum_threads
  resources :attachments
  resources :comments
  resources :attendances



  # api
  namespace :api, defaults: { format: 'json' } do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :events do
        post :invite, on: :member
      end
      resources :event_instances do
        post :mark_present, on: :member
      end
    end
  end

end
