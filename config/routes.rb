ManilaEnvelope::Application.routes.draw do
  devise_for :users
  resources :documents

  get '/dashboard' => "home#dashboard"
  root :to => "home#index"
end
