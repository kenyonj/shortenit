class Url < ActiveRecord::Base
  before_create :generate_unique_token

  validates :original_url, presence: true, url: true

  def to_param
    token
  end

  private

  def generate_unique_token
    self.token = SecureRandom.hex(2)
    while Url.exists?(token: token)
      self.token = SecureRandom.hex(2)
    end
  end
end
