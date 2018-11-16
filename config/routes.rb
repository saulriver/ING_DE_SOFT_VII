Rails.application.routes.draw do

resources :welcome, only: [:index]
root 'welcome#index'
  resources :egresados
  resources :facultades
  resources :programas
  resources :reportes
  devise_for :users, controllers: { sessions: "users/sessions" } #, path: 'auth', path_names:
#  { sign_in: 'login', sign_out: 'logout', password: 'secret',
#    confirmation: 'verification',
#    unlock: 'unblock',
#    registration: 'register',
#     sign_up: 'cmon_let_me_in' }
  #


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
