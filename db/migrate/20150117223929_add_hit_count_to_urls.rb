class AddHitCountToUrls < ActiveRecord::Migration
  def change
    add_column :urls, :hit_count, :integer, default: 0
  end
end
