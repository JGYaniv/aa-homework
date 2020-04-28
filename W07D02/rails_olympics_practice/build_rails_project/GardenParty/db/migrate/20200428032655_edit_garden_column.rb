class EditGardenColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :gardens, :user_id, :garden_owner_id
  end
end
