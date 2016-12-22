class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name
      t.string :slug, index: true, null: false, unique: true
      t.integer :status_id, default: 1

      t.text :copy
      t.text :duties
      t.text :pay

      t.boolean :hot_industry, default: false
      t.boolean :needs_certification, default: false

      t.references :answer_1
      t.references :answer_2
      t.references :answer_3
      t.references :answer_4

      t.timestamps
    end
  end
end
