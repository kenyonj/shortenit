require "spec_helper"

describe Url do
  it { should validate_presence_of(:original_url) }

  context "#to_param" do
    it "returns the token for the url" do
      url = create(:url)

      expect(url.token).to eq url.to_param
    end
  end
end
