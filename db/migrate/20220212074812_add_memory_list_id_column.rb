class AddMemoryListIdColumn < ActiveRecord::Migration[6.1]
  def change
    add_column(:compositions, :memory_list_id, :integer)
  end
end
