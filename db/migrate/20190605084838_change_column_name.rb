class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :rides, :type, :ride_type
  end
end
