Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/geolocation', to: 'geolocations#show'

      get '/forecast', to: 'forecast#show'

      get '/backgrounds', to: 'backgrounds#show'

      get '/munchies', to: 'munchies#index'
    end
  end
end
