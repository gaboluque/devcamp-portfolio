# frozen_string_literal: true

# DefaultPageContent Module
module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_title
  end

  def set_title
    @page_title = 'Devcamp portfolio'
  end
end
