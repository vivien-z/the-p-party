class AddCoordinatesToThemes < ActiveRecord::Migration[6.0]
  def change
    add_column :themes, :latitude, :float
    add_column :themes, :longitude, :float
  end
end
