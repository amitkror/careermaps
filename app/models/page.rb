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

class Page < ActiveRecord::Base

  # Concerns
  include Sluggable
  include Statusable
  acts_as_sluggable(source: :title, check_duplicates: true)

  # Validations
  validates :title, presence: true
  validates :slug, uniqueness: true

  # Properties
  def absolute_url
    "/#{self.slug}"
  end

  def meta
    return self.meta_description unless self.meta_description.blank?
    return self.copy_top unless self.copy_top.blank?
    return self.copy unless self.copy.blank?
    ""
  end

  def nav_title
    self.short_title.blank? ? self.title : self.short_title
  end

  def to_param
    self.slug
  end

  # Class methods
  class << self

    def ordered
      order("#{self.table_name}.title")
    end

    def nav
      active.where(in_nav: true).ordered
    end

    def search(term)
      where("title ILIKE ?", "%#{term}%").order("#{self.table_name}.title")
    end

    def skinny
      select(['id', 'title', 'slug', 'updated_at']\
        .collect {|s| "#{self.table_name}.#{s}"}.join(","))
    end
  end
end
