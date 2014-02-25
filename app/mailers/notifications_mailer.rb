class NotificationsMailer < ActionMailer::Base

  default :from => "hobo@hobogrammer.net"
  default :to=>"andrepsmithjr@gmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "Hobogrammer.net #{message.subject}")
  end
end
