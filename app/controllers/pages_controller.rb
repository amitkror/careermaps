class PagesController < ApplicationController

  def show

    @page = Page.from_param(params[:id])

    if @page.unpublished?

      return render_404 unless user_signed_in? && current_user.admin?

      flash.now[:alert] = "This is only visible to administrators."

    end

    authenticate_user! if @page.password_protected

    redirect_to @page.redirect_to unless @page.redirect_to.blank?

    render 'pages/show'
  end

end
