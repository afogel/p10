class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :phone_number
      t.string  :email_address
      t.integer :user_id
      t.integer :contact_interval, default: 30
      t.date    :last_reminder, default: Date.today

      t.timestamps
    end
  end
end
