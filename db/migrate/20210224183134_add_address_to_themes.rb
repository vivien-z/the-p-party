class AddAddressToThemes < ActiveRecord::Migration[6.0]
  def change
    add_column :themes, :theme_address, :string
  end
end
