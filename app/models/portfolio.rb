# frozen_string_literal: true

# Portfolio Model
class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.react
    where(subtitle: 'ReactJS')
  end

  scope :rails, -> { where(subtitle: 'Ruby on Rails') }

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= 'https://picsum.photos/600/400'
    self.thumb_image ||= 'https://picsum.photos/350/200'
  end
end
