class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :abbr
      t.string :state_name
      t.integer :country_id

      t.timestamps
    end
    add_index :states, [:abbr, :country_id], :unique=>true
  end
end
