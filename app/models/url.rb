class Url < ActiveRecord::Base
  before_create :generate_unique_token, :escape_original_url
  belongs_to :user

  validate :check_if_url_is_valid

  def to_param
    token
  end

  private

  def check_if_url_is_valid
    unless self.original_url.strip.downcase.start_with?('http')
      errors.add(:url, 'must start with http or https.')
    end
  end

  def generate_unique_token
    self.token = SecureRandom.hex(2)
    while Url.exists?(token: token)
      self.token = SecureRandom.hex(2)
    end
  end

  def escape_original_url
    self.original_url = URI.escape(original_url.strip)
  end
end
