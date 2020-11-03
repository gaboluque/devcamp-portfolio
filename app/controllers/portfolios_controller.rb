# frozen_string_literal: true

# Porfolio items contorller
class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end
end
