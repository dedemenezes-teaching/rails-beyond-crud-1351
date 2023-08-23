Rails.application.routes.draw do
  resources :restaurants do
    resources :reviews, only: %i[new create]
    collection do
      # Custom index
      # /restaurants/whatever_you_decide
      # verb :path
      get :top
    end

    member do
      # Custom show
      # /restaurants/13/whatever_you_decide
      # verb :path
      get :chef
    end
  end

  resources :reviews, only: :destroy
  # get '/restaurants/top', to: 'restaurants#top'
end
