# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  title      :text
#  order      :integer          default(0)
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Question, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
