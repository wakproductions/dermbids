class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :business_name
      t.string :address1
      t.string :address2
      t.string :city
      t.integer :state
      t.string :postal_code
      t.integer :quote_request_contact_user_id

      t.timestamps
    end
  end
end
