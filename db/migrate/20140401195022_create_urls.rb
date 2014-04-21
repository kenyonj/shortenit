class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :name
      t.string :orginal_url
      t.string :shortened_url
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
