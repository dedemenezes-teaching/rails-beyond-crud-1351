Rails.application.routes.draw do
  resources :restaurants do
    resources :reviews, only: %i[new create]
    collection do
      # Custom index
      # /restaurants/whatever_you_decide
      # verb :path
      get :top #=> get '/restaurants/top', to: 'restaurants#top'
    end

    member do
      # Custom show
      # /restaurants/13/whatever_you_decide
      # verb :path
      get :chef #=> get '/restaurants/13/chef', to: 'restaurants#chef'
    end
  end

  resources :reviews, only: :destroy
end
