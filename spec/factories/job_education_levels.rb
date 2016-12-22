# == Schema Information
#
# Table name: job_education_levels
#
#  id                 :integer          not null, primary key
#  education_level_id :integer
#  job_id             :integer
#  created_at         :datetime
#  updated_at         :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job_education_level do
    education_level nil
    job nil
  end
end
