class ChangeAddressFormatFromTools < ActiveRecord::Migration[6.0]
  def change
    change_column :tools, :address, :string
  end
end
