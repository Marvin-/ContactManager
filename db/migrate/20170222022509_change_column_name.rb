class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :email_addresses, :peron_id, :person_id
  end
end
