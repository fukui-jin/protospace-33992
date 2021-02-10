class RenamePccupationColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :pccupation, :occupation
  end
end
