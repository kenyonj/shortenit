require "spec_helper"

describe RedirectsController do
  context "#show" do
    it "redirects to the url's original_url" do
      url = create(:url)
      allow(controller).to receive(:find_url).and_return(url)

      get :show, id: url.token

      expect(response).to redirect_to(url.original_url)
    end
  end
end
