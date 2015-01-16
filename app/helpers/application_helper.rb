module ApplicationHelper
  def url_count
    Url.all.count
  end
end
