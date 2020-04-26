class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :document
      t.string :email

      t.timestamps
    end
  end
end
