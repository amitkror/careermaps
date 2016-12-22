# == Schema Information
#
# Table name: career_jobs
#
#  id         :integer          not null, primary key
#  career_id  :integer
#  job_id     :integer
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :career_job do
    career nil
    job nil
  end
end
