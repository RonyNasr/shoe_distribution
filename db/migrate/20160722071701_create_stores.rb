class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.column(:name,:string)
      t.column(:location,:string)

      t.timestamps()
    end
    create_table(:shoes_stores) do |t|
      t.column(:store_id, :int)
      t.column(:shoe_id, :int)
      
      t.timestamps()
    end
  end
end
