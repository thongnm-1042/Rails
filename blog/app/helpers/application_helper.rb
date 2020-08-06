module ApplicationHelper
  def full_title page_title
    base_title = t(".intro")
    page_title.blank? ? base_title : page_title + " | " + base_title
  end
end
