class CreateEmailAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :email_addresses do |t|
      t.string :address
      t.integer :peron_id

      t.timestamps
    end
  end
end
