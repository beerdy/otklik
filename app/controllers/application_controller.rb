class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # Localize  
  before_action :set_locale
  attr_accessor :ln
  # END Localize
  
  def initialize
    super
    read_content
  end

  private
  def read_content
    Content.all.each do |c|
      @headr  = c if c.url == "headr"
      @localr = c if c.url == "localr"
      @coder  = c if c.url == "coder"
    end
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
