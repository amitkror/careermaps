class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :question, index: true
      t.text :text
      t.integer :order, default: 0


      t.timestamps
    end
  end
end
