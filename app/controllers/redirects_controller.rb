class RedirectsController < ApplicationController
  def show
    url = find_url
    redirect_to url.original_url
  end
end
