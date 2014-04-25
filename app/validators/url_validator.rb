class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << (options[:message] || "must be a valid URL") unless url_valid?(value)
  end

  private

  def url_valid?(url)
    url = URI.parse(url) rescue false
    valid_protocol?(url)
  end

  def valid_protocol?(url)
    url.kind_of?(URI::HTTP) || url.kind_of?(URI::HTTPS)
  end
end
