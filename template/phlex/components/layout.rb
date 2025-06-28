class Components::Layout < Components::Base
  def initialize(page_info)
    @page_info = page_info
  end

  def view_template
    doctype

    html dir: direction, lang: I18n.locale do
      Head(@page_info)

      body do
        Flash()

        yield
      end
    end
  end
end
