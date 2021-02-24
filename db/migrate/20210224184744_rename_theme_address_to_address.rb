class RenameThemeAddressToAddress < ActiveRecord::Migration[6.0]
  def change
    rename_column(:themes, :theme_address, :address)
  end
end
