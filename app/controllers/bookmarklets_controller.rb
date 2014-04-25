class BookmarkletsController < ApplicationController
  def create
    url = Url.find_or_create_by(url_params)
    redirect_to url
  end

  private

  def url_params
    params.require(:url).permit().merge(
      original_url: format(params[:url][:original_url])
    )
  end

  def format(url)
    UrlFormatter.new(url).formatted_url
  end
end
