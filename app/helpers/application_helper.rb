module ApplicationHelper
  def l
    if I18n.locale == I18n.default_locale then
      # ru
      @ln ||= DeepStruct.wrap YAML::load(@localr.description)
    else
      # en
      @ln ||= DeepStruct.wrap YAML::load(@localr.slave)
    end
  end
end
