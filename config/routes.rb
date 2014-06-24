VimPastebin::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :pastes

  root 'pastes#index'

  get 'users/pastes' => 'pastes#user_pastes'
end
