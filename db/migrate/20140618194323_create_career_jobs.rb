class CreateCareerJobs < ActiveRecord::Migration
  def change
    create_table :career_jobs do |t|
      t.references :career, index: true
      t.references :job, index: true

      t.timestamps
    end
  end
end
