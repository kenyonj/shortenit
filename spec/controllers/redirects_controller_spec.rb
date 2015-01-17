require "spec_helper"

describe RedirectsController do
  context "#show" do
    it "redirects to the url's original_url" do
      url = create(:url)
      allow(Url).to receive(:find_by).and_return(url)

      get :show, id: url.token

      expect(response).to redirect_to(url.original_url)
    end

    it "increments the hit counter by 1" do
      url = create(:url)
      allow(Url).to receive(:find_by).and_return(url)

      get :show, id: url.token

      expect(url.hit_count).to eq 1
    end
  end
end
