class AddStatusToRental < ActiveRecord::Migration[6.0]
  def change
    add_column :rentals, :status, :integer
  end
end
