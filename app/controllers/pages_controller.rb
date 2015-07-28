class PagesController < ApplicationController
  def show
    @page = Page.find((params[:id] || 1).to_i)
  end

  def styles
    @page = Page.find(params[:id])
  end

  def clone
    @page = (@original_page = Page.find(params[:id])).dup
  end

  def update
    @page = Page.find(params[:id])
    @page.set_styles!(params[:page])
    @page.update_attributes(update_page_params)

    redirect_to @page
  end

  def create
    @page = Page.find(params[:page_id]).dup
    @page.attributes = create_page_params
    @page.save

    redirect_to @page
  end

  private

    def update_page_params
      params.require(:page).permit(:title, :font)
    end

    def create_page_params
      params.require(:page).permit(:title, :font, :content)
    end
end
