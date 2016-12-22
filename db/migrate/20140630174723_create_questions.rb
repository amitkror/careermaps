class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :title
      t.integer :order, default: 0

      t.timestamps
    end
  end
end
