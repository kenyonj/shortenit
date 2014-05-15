class AddBlurredToUrls < ActiveRecord::Migration
  def change
    add_column :urls, :blurred, :boolean, default: false
  end
end
