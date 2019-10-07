class ShortLink < ApplicationRecord
  validates :url, url: true, presence: true

  before_create :set_short_url

  private

  def set_short_url
    short_url = SecureRandom.hex(6)
    while ShortLink.where(short_url: short_url).count > 0 do
      short_url = SecureRandom.hex(6)
    end
    self.short_url = SecureRandom.hex(6)
  end
end
