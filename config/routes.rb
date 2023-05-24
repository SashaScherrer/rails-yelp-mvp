Rails.application.routes.draw do
  resources :restaurants do
    resources :reviews, only: [:new, :index, :create] # TODO: index is probably not necessary anymore
  end
end
