class UrlFormatter
  attr_reader :url

  def initialize(url)
    @url = URI.escape(url.strip)
  end

  def formatted_url
    if missing_protocol?
      url.prepend("http://")
    end

    url
  end

  private

  def missing_protocol?
    (missing_http? && missing_https?) && missing_ftp?
  end

  def missing_http?
    !url.starts_with?("http://")
  end

  def missing_https?
    !url.starts_with?("https://")
  end

  def missing_ftp?
    !url.starts_with?("ftp://")
  end
end
