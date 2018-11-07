Rails.application.routes.draw do

  
resources :welcome, only: [:index]
root 'welcome#index'
  resources :egresados
  resources :facultades
  resources :programas
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
