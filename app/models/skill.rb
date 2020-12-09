# frozen_string_literal: true

# Skill Model
class Skill < ApplicationRecord
  validates_presence_of :title, :percent_utilized
end
