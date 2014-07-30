class Users < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :username
      t.string  :password
      t.string  :first_name
      t.string  :last_name
      t.string  :phone_number
      t.string  :email_address

      t.timestamps
    end
  end
end
