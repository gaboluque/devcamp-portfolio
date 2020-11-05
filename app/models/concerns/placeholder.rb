module Placeholder
  extend ActiveSupport::Concern

  def self.image_generator(width:, height:)
    "https://picsum.photos/#{width}/#{height}"
  end
end
