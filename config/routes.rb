Rails.application.routes.draw do
  resources :egresados
  resources :facultades
  resources :programas
  root 'egresados#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
