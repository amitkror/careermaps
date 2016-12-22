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

class Career < ActiveRecord::Base

  # Concerns
  include Sluggable
  include Statusable
  acts_as_sluggable(
    check_duplicates: false,
  )

  has_many :career_jobs, dependent: :destroy
  has_many :jobs, through: :career_jobs

  # Properties
  def absolute_url
    "/careers/#{self.slug}"
  end

  def full_name
    "#{self.name}, #{self.state}".chomp(", ")
  end

  def over?
    Date.today > self.end_date
  end

  def status_s
    STATUSES.rassoc(self.status_id).first
  end

  def to_param
    self.slug
  end

  def last_career
    self == Career.last
  end

  class << self

    def ordered
      order("#{self.table_name}.order")
    end

    def next(id)
      ordered.
      where("id > ?", id).
      first
    end



    def search(term)
      where("name ILIKE ?", "%#{term}%").order("#{self.table_name}.name")
    end

    def skinny
      select(['id', 'name', 'slug', 'hot_industry', 'needs_certification',
        'updated_at']\
        .collect {|s| "#{self.table_name}.#{s}"}.join(","))
    end
  end
end
