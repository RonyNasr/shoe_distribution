class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.column(:brand,:string)

      t.timestamps()
    end
  end
end
