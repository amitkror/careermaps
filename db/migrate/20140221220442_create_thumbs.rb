class CreateThumbs < ActiveRecord::Migration
  def change
    create_table :thumbs do |t|
      t.string :uid
      t.string :signature

      t.timestamps
    end
  end
end
