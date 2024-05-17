Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get ':username', to: 'users#show', as: :user
  get '/orders/download_csv', to: 'orders#download_csv', as: 'download_orders_csv'


  resources :users 
  root to: "users#index"
end
