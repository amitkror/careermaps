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

class Question < ActiveRecord::Base
  has_many :answers
  accepts_nested_attributes_for :answers

  class << self

    def ordered
      order("#{self.table_name}.order")
    end

    def search(term)
      where("name ILIKE ?", "%#{term}%").order("#{self.table_name}.name")
    end
  end

end
