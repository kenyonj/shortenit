Shortenit::Application.routes.draw do
  constraints ip: IpsRouting.new do
    root 'urls#new'

    resources :urls, only: [:new, :create, :show]

    resources :redirects, only: [:show], path: ''

    get '/shorten/create' => 'bookmarklets#create'
  end

  class IpsRouting
    def initialize
      @ips = ENV['BANNED_IPS']
    end

    def matches?(request)
      return false if !@ips.include?(request.remote_ip)
      true
    end
  end
end
