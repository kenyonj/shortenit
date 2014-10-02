class RemoveBlurredFromUrls < ActiveRecord::Migration
  def change
    remove_column :urls, :blurred
  end
end
