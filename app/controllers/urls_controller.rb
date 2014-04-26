class UrlsController < ApplicationController
  respond_to :html
  before_action :count_urls, only: [:new, :show]

  def new
    @url = Url.new
  end

  def create
    @url = Url.find_or_create_by(url_params)
    respond_with @url
  end

  def show
    @url = find_url
  end

  private

  def find_url
    Url.find_by(token: params[:id])
  end

  def url_params
    params.require(:url).permit().merge(
      original_url: format(params[:url][:original_url])
    )
  end

  def format(url)
    UrlFormatter.new(url).formatted_url
  end

  def count_urls
    @url_count = Url.all.count
  end
end
