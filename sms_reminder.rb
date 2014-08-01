require_relative 'config/environment.rb'

class Reminder
  def initialize
    @reminder_queue = []
  end
  def remind!
    @reminder_queue = find_reminders_to_be_sent
    send_reminders(@reminder_queue)
    clear_reminder_queue!
  end

  private
  def find_reminders_to_be_sent
    db_query = Contact.select(:contact_interval, :last_reminder) do |c|
      Date.today - c.last_reminder >= c.contact_interval
    end
    format_data_for_sms_class(db_query)
  end

  def format_data_for_sms_class(db_query)
    db_query.each_with_object([]) do |contact, formatted_queue|
      user = {}
      user[:message] = contact.reminder_message
      user[:phone_number] = contact.user.phone_number
      formatted_queue << user
    end
  end

  def send_reminders(reminder_queue)
    messages = TwilioWrapper.new(reminder_queue)
    messages.send!
  end

  def clear_reminder_queue!
    @reminder_queue.clear
  end
end


Reminder.new.remind!