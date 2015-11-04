class CreateHashtags < ActiveRecord::Migration
  def change
    create_table :hashtags do |t|
      t.string :slug
      t.text :description

      t.timestamps null: false
    end
  end
end
