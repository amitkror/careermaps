module Sortable
  extend ActiveSupport::Concern

  included do

    before_action :setup_index, only: [:index]

    def index
    end

    private

      def setup_index
        @order = params[:order]
        @dir = (params[:dir].blank? || params[:dir] == "asc") ? "asc" : "desc"

        @per_page = params[:per_page] || session[:per_page] || 25
        session[:per_page] = @per_page
      end
  end

end
