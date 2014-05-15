module ApplicationHelper
  def url_count
    Url.all.count
  end

  def website_screenshot(url)
    img_src = "https://api.browshot.com/api/v1/simple?"\
              "url=#{url.original_url}&instance_id="\
              "12&key=#{ENV.fetch("BROWSHOT_KEY")}"
    img_src
  end
end
