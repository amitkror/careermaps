#
# Models that use this concern MUST have a 'status_id' column.
# use it with include Statusable
#

module Statusable
  extend ActiveSupport::Concern

  STATUSES = {
    Published: 1,
    Unpublished: 2,
    Hidden: 3,
  }

  included do

    def active?
      self.status_id == STATUSES[:Published]
    end

    def hidden?
      self.status_id == STATUSES[:Hidden]
    end

    def status_s
      STATUSES.rassoc(self.status_id).first
    end

    def unpublished?
      self.status_id == STATUSES[:Unpublished]
    end
  end

  module ClassMethods

    def active
      where(status_id: STATUSES[:Published])
    end

    def active_or_hidden
      where(status_id: [STATUSES[:Hidden], STATUSES[:Published]])
    end

  end

end
