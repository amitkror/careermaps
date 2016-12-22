class Admin::AdminController < ApplicationController

  before_action :authenticate_user!

  layout 'admin/layouts/admin'

  def index
    redirect_to admin_jobs_path
  end

end
