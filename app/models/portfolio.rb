# frozen_string_literal: true

# Portfolio Model
class Portfolio < ApplicationRecord
  has_many :technologies

  accepts_nested_attributes_for :technologies,
                                reject_if: ->(tech) { tech['name'].blank? }

  validates_presence_of :title, :body

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  def self.react
    where(subtitle: 'ReactJS')
  end

  def self.by_position
    order('position ASC')
  end

  scope :rails, -> { where(subtitle: 'Ruby on Rails') }
end
