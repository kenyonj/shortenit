require "spec_helper"

describe UrlFormatter do
  context ".initialize" do
    it "escapes/removes whitespace the url and sets the instance variable" do
      unformatted_url = "     example.com/?a=\11\15      "
      formatter = UrlFormatter.new(unformatted_url)

      url = formatter.instance_variable_get("@url")

      expect(url).to eq "example.com/?a=%09%0D"
    end
  end

  context "#formatted_url" do
    it "adds 'http://' to the beginning of the url" do
      unformatted_url = "example.com"
      formatter = UrlFormatter.new(unformatted_url)

      expect(formatter.formatted_url).to eq "http://example.com"
    end
  end
end
