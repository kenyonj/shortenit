class RedirectsController < ApplicationController
  def show
    url = get_url
    redirect_to url.original_url
  end

  private

  def get_url
    Url.find_by(token: params[:id])
  end
end
