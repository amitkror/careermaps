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

require 'rails_helper'

RSpec.describe CareerJob, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
