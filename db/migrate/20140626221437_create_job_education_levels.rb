class CreateJobEducationLevels < ActiveRecord::Migration
  def change
    create_table :job_education_levels do |t|
      t.references :education_level, index: true
      t.references :job, index: true

      t.timestamps
    end
  end
end
