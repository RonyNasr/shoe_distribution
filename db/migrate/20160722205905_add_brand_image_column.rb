class AddBrandImageColumn < ActiveRecord::Migration
  def change
    add_column(:brands, :image, :varchar)
  end
end
