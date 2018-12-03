module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Antwaun Johnson | My Portfolio Website"
    @seo_keywords = "Antwaun Johnson portfolio Fullstack Developer"
  end
end
