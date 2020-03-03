module ApplicationHelper
  def title page_name
    page_name.presence || I18n.t(".base")
  end

  def image_for user
    return image_tag user.image.url, class: "avatar" if user.image.present?
    image_tag "avatar.png", class: "avatar"
  end

  def gender_for user
    return t "users.unknow" if user.gender.nil?
    user.gender ? t("users.male") : t("users.female")
  end

  def login_from_by user
    return t "users.login_by_system" if user.provider.nil?
    user.provider == "facebook" ? t("users.login_by_fb") : t("users.login_by_gg")
  end
end
