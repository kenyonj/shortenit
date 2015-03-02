Shortenit::Application.routes.draw do
  root 'urls#new'

  resources :urls, only: [:new, :create, :show]

  resources :redirects, only: [:show], path: ''

  get '/shorten/create' => 'bookmarklets#create'
end
