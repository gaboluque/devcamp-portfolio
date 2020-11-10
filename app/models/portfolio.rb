# frozen_string_literal: true

# Portfolio Model
class Portfolio < ApplicationRecord
  include Placeholder

  has_many :technologies

  accepts_nested_attributes_for :technologies,
                                reject_if: ->(tech) { tech['name'].blank? }

  validates_presence_of :title, :body, :main_image, :thumb_image
  after_initialize :set_defaults

  def self.react
    where(subtitle: 'ReactJS')
  end

  scope :rails, -> { where(subtitle: 'Ruby on Rails') }

  def set_defaults
    self.main_image ||= Placeholder.image_generator(width: 600, height: 400)
    self.thumb_image ||= Placeholder.image_generator(width: 350, height: 200)
  end
end
