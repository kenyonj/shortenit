class BookmarkletsController < ApplicationController
  def create
    url = Url.find_or_create_by(original_url: url_params)
    redirect_to url
  end

  private

  def url_params
    params.require(:original_url)
  end
end
