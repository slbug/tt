module ApplicationHelper
  def page_title(page)
    return 'No Title' unless page

    page.title
  end

  def font_styles(page)
    "font-family: #{page.font}"
  end
end
