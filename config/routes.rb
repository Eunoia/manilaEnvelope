ManilaEnvelope::Application.routes.draw do
  devise_for :users
  resources :documents

  root :to => "home#index"
end
