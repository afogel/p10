class TwilioWrapper
  def initialize(user_and_message = {})
    @client = Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILIO_TOKEN'])
    @from = ENV['TWILIO_FROM']
    @user_and_message = user_and_message
  end

  def send!
    @user_and_message.each do |message, user_number|
      @client.account.messages.create(
        :from => @from,
        :to => user_number,
        :body => message
        )
    end
  end
end
