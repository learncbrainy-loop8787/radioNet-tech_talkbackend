Rails.application.routes.draw do
  resources :unit_warriors, only: [:index, :create, :destroy, :show]
  resources :units, only: [:index, :show]
  resources :warriors, only: [:index, :show]
  resources :users

  post '/dday' => 'units#dday'

  get '/sort_kills_asc' => 'warriors#sort_kills_asc'
  get '/sort_kills_desc'=> 'warriors#sort_kills_desc'

  get '/find_single' => 'warriors#find_single'
  get '/find_thousands' => 'warriors#find_thousands'
  get '/find_millions' => 'warriors#find_millions'
 
  get '/find_master' => 'warriors#find_master'
  get '/find_intermediate' => 'warriors#find_legend'
  get '/find_god' => 'warriors#find_god'

   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
