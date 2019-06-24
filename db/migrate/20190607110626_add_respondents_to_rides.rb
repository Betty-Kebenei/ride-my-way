class AddRespondentsToRides < ActiveRecord::Migration[5.2]
  def change
    add_column :rides, :respondents, :text, array: true, default: []
  end
end
