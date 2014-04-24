class UrlsController < ApplicationController
  respond_to :html

  def new
    @url = Url.new
  end

  def create
    @url = Url.create(url_form_params)
    respond_with @url
  end

  def show
    @url = find_url
  end

  private

  def url_form_params
    params.require(:url).
      permit(:original_url)
  end
end
