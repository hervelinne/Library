Rails.application.routes.draw do
  resources :emprunt_materiels
  resources :emprunt_docs
  get 'static_pages/home'
  get 'static_pages/aide'
  root'static_pages#home'
  resources :materiels
  resources :documents
  resources :adherents

end
