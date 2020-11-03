Rails.application.routes.draw do
  resources :blogs
  resources :portfolios

  root to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
end
