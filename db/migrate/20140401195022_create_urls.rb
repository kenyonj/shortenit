class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :name, null: false
      t.string :original_url, null: false
      t.string :token, null: false
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
