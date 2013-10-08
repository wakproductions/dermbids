class RenameOrganizationToClinic < ActiveRecord::Migration
  def change
    rename_table :organizations, :clinics
  end
end
