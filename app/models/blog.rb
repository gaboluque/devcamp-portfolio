# frozen_string_literal: true

# Blog Model
class Blog < ApplicationRecord
  extend FriendlyId

  enum status: { draft: 0, published: 1 }
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body
end
