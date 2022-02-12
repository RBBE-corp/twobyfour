class RemoveMemoryListColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column(:compositions, :memory_list, :text)
  end
end
