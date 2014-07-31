class Contacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :phone_number
      t.string  :email_address
      t.integer :user_id
      t.date    :contact_interval, default: 30.days
      t.date    :last_reminder, default: Date.today

      t.timestamps
    end
  end
end


# research on twilio and research on background jobs
# user_contacts = User.find(user_id).contacts
# user_contacts.where do |contact|
# if contact.last_reminder - Date.today >= contact.contact_interval
#   send alert
#   User.needs_contact_sent
# end

# User.contacts.where(last_reminder)
