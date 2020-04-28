class CreateFlowers < ActiveRecord::Migration[5.2]
  def change
    create_table :flowers do |t|
      t.string :flower_type
      t.integer :gardener_id
      t.integer :garden_id

      t.timestamps
    end

    add_index :flowers, :garden_id
    add_index :flowers, :gardener_id
  end
end
