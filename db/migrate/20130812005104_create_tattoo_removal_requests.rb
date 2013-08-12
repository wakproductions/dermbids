class CreateTattooRemovalRequests < ActiveRecord::Migration
  def change
    create_table :tattoo_removal_requests do |t|
      t.integer :quote_request_id
      t.string :image1_url
      t.string :image2_url
      t.string :reason
      t.string :location
      t.string :size
      t.string :inked_by
      t.string :ink_age
      t.string :colors
      t.string :skin_tone
      t.string :consultation_visit
      t.string :consultation_looking_reason
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :age
      t.integer :zip
      t.string :referral

      t.timestamps
    end
  end
end
