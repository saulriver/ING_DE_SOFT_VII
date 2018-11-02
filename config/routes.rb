Rails.application.routes.draw do

  devise_for :users
resources :welcome, only: [:index]

  resources :egresados
  resources :facultades
  resources :programas
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
