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

require 'rails_helper'

RSpec.describe JobEducationLevel, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
