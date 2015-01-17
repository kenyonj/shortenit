class RedirectsController < ApplicationController
  def show
    url = find_url
    url.add_hit
    redirect_to url.original_url
  end

  private

  def find_url
    Url.find_by(token: params[:id])
  end
end
