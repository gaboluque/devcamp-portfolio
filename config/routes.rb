# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             path: '',
             path_names:
                { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  root to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :portfolios
  resources :blogs do
    member do
      put :toggle_status
    end
  end
end
