Cars::Application.routes.draw do
  resources :cars
  #resources :offers
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users

  get 'cars/:id/offers' => 'cars#offers', as: :car_offers
  get 'offers/:id' => 'offers#show', as: :offer
  put 'offers/:id' => 'offers#accept', as: :accept_offer
  delete 'offers/:id' => 'offers#reject', as: :reject_offer
  post 'offers' => 'offers#create'
  put 'cars/:id/status' => 'cars#status', as: :car_status
  delete 'attached_assets/:id' => 'attached_assets#destroy', as: :delete_asset

  get 'store/edit' => 'store#edit', as: :edit_store
  put 'store/update' => 'store#update', as: :update_store
  get 'about' => 'home#about', as: :about


end