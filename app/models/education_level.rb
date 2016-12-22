# == Schema Information
#
# Table name: education_levels
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class EducationLevel < ActiveRecord::Base
  
  has_many :job_education_levels
  has_many :jobs, through: :job_education_levels

  accepts_nested_attributes_for :job_education_levels
end
