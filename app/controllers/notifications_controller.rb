class NotificationsController < ApplicationController
 
  skip_before_action :verify_authenticity_token
 
  def notify
    client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token

    message = client.messages.create from: '(770) 249-4448', to: '(678) 491-7762', body: 'Learning to send SMS you are.'
    render plain: message.status

  end
 
end