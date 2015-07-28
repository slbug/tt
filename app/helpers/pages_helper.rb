module PagesHelper
  def apply_styles(page)
    return unless page.content

    doc = Nokogiri::HTML::DocumentFragment.parse(page.content)
    doc.css('*').each{ |node| node.styles = '' }

    (page.styles || {}).each do |selector, styles|
      doc.css(selector).each { |node| node.styles = styles }
    end

    doc.to_html
  end
end
