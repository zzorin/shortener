class Url < ApplicationRecord
  validates_presence_of :url
  validates_uniqueness_of :short_url

  before_create :generate_short_url

  private

  def generate_short_url
    self.short_url = Digest::MD5.hexdigest(self.url)[0..10]
  end
end
