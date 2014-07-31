class User < ActiveRecord::Base
  has_many :contacts
  # Remember to create a migration!
  # scope :needs_messages_sent, -> {|user| }
  def needs_reminder_sent?

  end
end
