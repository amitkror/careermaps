class CreateEducationLevels < ActiveRecord::Migration
  def change
    create_table :education_levels do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
