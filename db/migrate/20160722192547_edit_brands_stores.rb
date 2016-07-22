class EditBrandsStores < ActiveRecord::Migration
  def change
    rename_column(:brands_stores, :shoe_id, :brand_id)
  end
end
