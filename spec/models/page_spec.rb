# == Schema Information
#
# Table name: pages
#
#  id                 :integer          not null, primary key
#  title              :string(255)      not null
#  short_title        :string(255)
#  slug               :string(255)      not null
#  redirect_to        :string(255)
#  copy               :text
#  copy_top           :text
#  meta_description   :text
#  status_id          :integer          default(1)
#  order              :integer          default(1)
#  locked             :boolean          default(FALSE)
#  in_nav             :boolean          default(FALSE)
#  password_protected :boolean          default(FALSE)
#  created_at         :datetime
#  updated_at         :datetime
#

require 'spec_helper'

describe Page do
  pending "add some examples to (or delete) #{__FILE__}"
end
