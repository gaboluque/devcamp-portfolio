# frozen_string_literal: true

# Porfolio items contorller
class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Porfolio created.' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def portfolio_params
    params
      .require(:portfolio)
      .permit(:title, :subtitle, :body)
      .merge(
        main_image: 'https://picsum.photos/600/400',
        thumb_image: 'https://picsum.photos/350/200'
      )
  end
end
