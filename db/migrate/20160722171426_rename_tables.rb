class RenameTables < ActiveRecord::Migration
  def change
    rename_table(:shoes, :brands)
    rename_table(:shoes_stores, :brands_stores)
    rename_column(:brands, :brand, :name)
  end
end
