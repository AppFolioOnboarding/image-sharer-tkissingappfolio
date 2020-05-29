require 'uri'
class Image < ApplicationRecord
  acts_as_taggable_on :tags
  validates :url, url: { schemes: %w[http https] }
end
