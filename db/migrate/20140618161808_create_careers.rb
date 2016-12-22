class CreateCareers < ActiveRecord::Migration
  def change
    create_table :careers do |t|
      t.string :name, null: false
      t.text :short_description
      t.text :about_the_field
      t.text :a_good_fit
      t.string :slug, index: true, null: false, unique: true
      t.integer :order, default: 1
      t.integer :status_id, default: 1

      t.timestamps
    end
  end
end
