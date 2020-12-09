module PortfoliosHelper
  def image_generator(width:, height:)
    "https://picsum.photos/#{width}/#{height}"
  end

  def portfolio_img(img, type)
    return img if img.model.main_image? || img.model.thumb_image?
    return image_generator(height: '350', width: '200') if type == 'thumb'

    image_generator(height: '600', width: '400')
  end
end
