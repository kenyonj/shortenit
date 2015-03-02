require "spec_helper"

describe UrlsController do
  context "#new" do
    it "renders the new view" do
      get :new

      expect(response).to render_template(:new)
    end
  end

  context "#create" do
    context "with valid params" do
      it "creates the Url and redirects to the show for this Url" do
        url = create(:url)
        allow(Url).to receive(:find_or_create_by).and_return(url)

        post :create, url: { original_url: "http://test.com" }

        expect(response).to redirect_to(url_path(url.token))
      end
    end

    context "with invalid params" do
      it "renders the new view" do
        post :create, url: { original_url: "" }

        expect(response).to render_template(:new)
      end
    end
  end

  context "#show" do
    it "renders the show view" do
      url = create(:url)
      allow(Url).to receive(:find_by).and_return(url)

      get :show, id: url.token

      expect(response).to render_template(:show)
    end
  end
end
