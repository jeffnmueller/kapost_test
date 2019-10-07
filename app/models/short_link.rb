class ShortLink < ApplicationRecord
  validates :long_url, url: true, presence: true

  before_create :set_short_link

  private

  def set_short_link
    short_link = SecureRandom.hex(6)
    while ShortLink.where(short_link: short_link).count > 0 do
      short_link = SecureRandom.hex(6)
    end
    self.short_link = short_link
  end
end
