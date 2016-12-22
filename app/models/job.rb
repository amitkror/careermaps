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

class Job < ActiveRecord::Base

  # Concerns
  include Sluggable
  include Statusable
  acts_as_sluggable(check_duplicates: false)

  has_many :career_jobs, dependent: :destroy
  has_many :careers, through: :career_jobs

  has_many :job_education_levels, dependent: :destroy
  has_many :education_levels, through: :job_education_levels

  # Properties
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


  class << self

    def find_by_answers(a1, a2, a3, a4)
      answers = self.all
      unless a1.blank? || a1.to_i < 1
        answers = answers.where(answer_1_id: a1)
      end

      unless a2.blank? || a2.to_i < 1
        answers = answers.where(answer_2_id: a2)
      end

      unless a3.blank? || a3.to_i < 1
        answers = answers.where(answer_3_id: a3)
      end

      unless a4.blank? || a4.to_i < 1
        answers = answers.where(answer_4_id: a4)
      end
      answers
    end

    def find_by_filter(career_id)
      if career_id.blank?
        return self.all
      else
        joins(:career_jobs).
        where("career_id IN (?)", career_id)
      end
    end

    def filter_by_education(education_level, career)
      if education_level.blank?
        joins(:career_jobs).
        where("career_id IN (?)", career)
      else
        joins(:career_jobs).
        where("career_id IN (?)", career).
        joins(:job_education_levels).
        where("education_level_id IN (?)", education_level)
      end
    end

    def ordered
      order(:name)
    end


    def related_jobs(job)
      joins(:career_jobs)
      .where("career_id IN (?)", job.career_ids)
      .where("job_id != ?", job.id)
      .distinct
      .ordered
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
