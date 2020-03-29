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

  def image_of pitch, text
    return image_tag pitch.image.url, class: text if pitch.image.present?
    image_tag "pitch_default.jpg", class: text
  end

  def logo_for team, text
    return image_tag team.logo.url, class: text if team.logo.present?
    image_tag "logo-football.png", class: text
  end
end
