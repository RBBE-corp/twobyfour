class AddNameToCompositions < ActiveRecord::Migration[6.1]
  def change
    add_column :compositions, :name, :string
  end
end
