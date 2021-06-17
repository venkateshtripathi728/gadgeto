class AddDefaultValuetoStatuts < ActiveRecord::Migration[6.0]
  def up
    change_column :bookings, :status, :text, default: "pending"
  end

  def down
    change_column :bookings, :status, :string, default: "pending"
  end
end
