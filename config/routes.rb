Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'status/:date', to: 'statuses#show'
  get 'slot/:date_time', to: 'slots#show'
end
