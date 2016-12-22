# == Schema Information
#
# Table name: careers
#
#  id                :integer          not null, primary key
#  name              :string(255)      not null
#  short_description :text
#  about_the_field   :text
#  a_good_fit        :text
#  slug              :string(255)      not null
#  order             :integer          default(1)
#  status_id         :integer          default(1)
#  created_at        :datetime
#  updated_at        :datetime
#

require 'rails_helper'

RSpec.describe Career, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
