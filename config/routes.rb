Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  post 'user_token' => 'user_token#create'

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

  get :dashboard, to: 'dashboard#index', as: :dashboard_index


  get '/events/invite_event' , to: 'events#invite_event'
  get '/events/uninvite_event' , to: 'events#uninvite_event'
   
  resources :events
  resources :event_instances, only: :destroy

  resources :events do
    member do
      get   :invite_user_form
      post  :invite_user
    end
  end
  resources :event_instances
  resources :polls
  resources :forum_threads
  resources :attachments
  resources :comments
  resources :attendances
  
  get '/event_instances/qrcode/:id', to: 'event_instances#qrcode', as: 'qrcode_event_instance'
  
end
