class NotificationsController < ApplicationController
 
  skip_before_action :verify_authenticity_token
 
  def notify
    text_message = ""
    @user = User.find(session[:user_id])
    @tasks = @user.tasks
    @tasks.each do |task|
      text_message.concat(task.content)
      text_message.concat("\n")
    end

    client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token

    message = client.messages.create from: '(770) 249-4448', to: '(678) 491-7762', body: text_message
  
    redirect_to tasks_path 

    if message.status == "queued"
      flash[:success] = "Text has been sent!"
    end

  end
end