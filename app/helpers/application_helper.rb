module ApplicationHelper
  def title page_name
    page_name.presence || I18n.t(".base")
  end
end
