require "spec_helper"

describe ApplicationHelper do
  context "#url_count" do
    it "returns the count of Url's" do
      5.times { create(:url) }

      expect(helper.url_count).to eq 5
    end
  end
end
