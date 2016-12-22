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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :thumb do
    uid "MyString"
    signature "MyString"
  end
end
