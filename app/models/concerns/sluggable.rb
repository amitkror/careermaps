#
# Models that use this concern MUST have 'slug' and 'title' or 'name' columns.
# use it with include Sluggable
#

module Sluggable
  extend ActiveSupport::Concern

  included do

    validates :slug, presence: true

    def set_slug

      unless self.slug.blank?
        check_integer
        return true
      end

      opts = self.class.sluggable_options

      source_field = opts[:source]
      self.slug = self.send(source_field).parameterize.parameterize

      check_duplicates if opts[:check_duplicates]
      check_integer
    end

    private
      def check_duplicates
        orig_val = self.slug
        val = orig_val
        i = 2
        while self.class.where(slug: val).exists?
          val = "#{orig_val}-#{i}"
          i += 1
        end
        self.slug = val
      end

      def check_integer
        # check to see if it's an integer and make it a string
        self.slug = "#{self.class.name.parameterize}-#{self.slug }" if !!(self.slug =~ /^[-+]?[0-9]+$/)
      end
  end

  module ClassMethods

    def acts_as_sluggable(args={})
      opts = {
        source: :name,
        check_duplicates: false,
      }

      set_sluggable_options(opts.merge(args))

      before_validation :set_slug
    end

    def from_param(param)
      self.find_by_slug!(param)
    end

    def set_sluggable_options(options)
      @sluggable_options = options
    end

    def sluggable_options
      @sluggable_options
    end

  end

end
