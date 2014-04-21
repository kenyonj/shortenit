Shortenit::Application.routes.draw do
  root 'urls#new'
  resources :passwords,
    controller: 'clearance/passwords',
    only: [:create, :new]

  resource :session,
    controller: 'clearance/sessions',
    only: [:create]

  resources :users,
    controller: 'clearance/users',
    only: Clearance.configuration.user_actions do
      resource :password,
        controller: 'clearance/passwords',
        only: [:create, :edit, :update]
  end

  get '/sign_in' => 'clearance/sessions#new', as: ''
  delete '/sign_out' => 'clearance/sessions#destroy', as: ''

  if Clearance.configuration.allow_sign_up?
    get '/sign_up' => 'clearance/users#new', as: ''
  end

  resources :urls, only: [:new, :create, :show]

  resources :redirects, only: [:show], path: ''
end
