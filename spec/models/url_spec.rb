require "spec_helper"

describe Url do
  it { should validate_presence_of(:original_url) }

  context "#to_param" do
    it "returns the token for the url" do
      url = create(:url)

      expect(url.token).to eq url.to_param
    end
  end

  context "before_create :generate_unique_token" do
    it "generates a token that does not exist" do
      existing_url = create(:url)
      allow(SecureRandom).to receive(:hex).with(2).
        and_return(existing_url.token, "new_token")

      new_url = Url.create(original_url: "http://example.com")

      expect(SecureRandom).to have_received(:hex).twice
      expect(new_url.token).to eq "new_token"
    end
  end
end
