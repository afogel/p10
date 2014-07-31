class UpdateContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :reminder_message, :text
  end
end
