class TwilioWrapper
  def initialize(friend_and_message = {})
    @client = Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILIO_TOKEN'])
    @from = ENV['TWILIO_FROM']
    @friend_and_message = friend_and_message
  end

  def send!
    @friend_and_message.each do |contact_number, message|
      @client.account.messages.create(
        :from => @from,
        :to => contact_number,
        :body => message
        )
    end
  end
end
