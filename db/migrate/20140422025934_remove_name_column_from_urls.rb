class RemoveNameColumnFromUrls < ActiveRecord::Migration
  def change
    remove_column :urls, :name
  end
end
