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

class CareerJob < ActiveRecord::Base
  belongs_to :career
  belongs_to :job
end
