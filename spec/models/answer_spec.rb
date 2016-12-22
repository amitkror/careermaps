# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  question_id :integer
#  text        :text
#  order       :integer          default(0)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'rails_helper'

RSpec.describe Answer, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
