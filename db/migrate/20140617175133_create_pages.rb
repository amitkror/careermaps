class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title, null: false
      t.string :short_title
      t.string :slug, index: true, null: false, unique: true
      t.string :redirect_to
      t.text :copy
      t.text :copy_top
      t.text :meta_description
      t.integer :status_id, default: 1
      t.integer :order, default: 1
      t.boolean :locked, default: false
      t.boolean :in_nav, default: false
      t.boolean :password_protected, default: false

      t.timestamps
    end
  end
end
