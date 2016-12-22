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

class JobEducationLevel < ActiveRecord::Base
  belongs_to :education_level
  belongs_to :job
end
