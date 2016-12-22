# == Schema Information
#
# Table name: thumbs
#
#  id         :integer          not null, primary key
#  uid        :string(255)
#  signature  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Thumb < ActiveRecord::Base
end
