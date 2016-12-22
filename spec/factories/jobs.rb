# == Schema Information
#
# Table name: jobs
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  slug                :string(255)      not null
#  status_id           :integer          default(1)
#  copy                :text
#  duties              :text
#  pay                 :text
#  hot_industry        :boolean          default(FALSE)
#  needs_certification :boolean          default(FALSE)
#  answer_1_id         :integer
#  answer_2_id         :integer
#  answer_3_id         :integer
#  answer_4_id         :integer
#  created_at          :datetime
#  updated_at          :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job do
  end
end
