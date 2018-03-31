class UserMailer < ApplicationMailer
  default from: 'ss48.a@yandex.ru'
 
  def welcome_email(message)
    @message = message
    @url  = 'http://otklik.pw'
    mail(to: 'ss48.a@yandex.ru', subject: 'OTKLIK.PW client')
  end
end
