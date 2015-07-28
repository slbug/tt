class Page < ActiveRecord::Base
  attr_accessor :selector, :style

  def set_styles!(params)
    return if params[:selector].blank?

    self.styles[params[:selector]] = params[:style]
  end

  def stylesheet
    styles.map do |selector, styles|
      "#{selector} { #{styles} }"
    end.join("\n")
  end
end
