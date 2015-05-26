Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'application#index'

  namespace :api do
    resources :questions do
      post :answer, on: :member
    end
  end

  # Send all requests to index page and let Backbone/Marionette do the rest
  match "*path", to: "application#index", via: :all
end
