require "spec_helper"

describe BookmarkletsController do
  context "#create" do
    it "creates a Url and redirects to it" do
      url = create(:url)
      allow(Url).to receive(:find_or_create_by).and_return(url)

      post :create, url: { original_url: "http" }

      expect(response).to redirect_to(url_path(url.token))
    end
  end
end
