class RedirectsController < ApplicationController
  def show
    @url = find_url
    if @url.blurred?
      render :blurred, layout: 'blurred'
    else
      redirect_to @url.original_url
    end
  end

  private

  def find_url
    Url.find_by(token: params[:id])
  end
end
