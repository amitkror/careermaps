class Admin::PagesController < Admin::AdminController

  include Adminable
  include Sortable

  before_action :check_for_lock, only: [:confirm_destroy, :destroy]

  def index
    @pages = Page.page(params[:page]).per(@per_page)

    @status_id = params[:status_id]
    @pages = @pages.where(status_id: @status_id) unless @status_id.blank?

    unless @order.blank?
      @pages = @pages.order("#{@order} #{@dir}")
    else
      @pages = @pages.ordered
    end
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      redirect_to admin_pages_path, notice: flash_message(@page).html_safe
    else
      render action: :new
    end
  end

  def update
    if @page.update(page_params)
      redirect_to admin_pages_path, notice: flash_message(@page).html_safe
    else
      render action: :edit
    end
  end

  def destroy
    @page.destroy
    redirect_to admin_pages_path, notice: 'Deleted.'
  end

  def search
    pages = Page.skinny.search(params[:term])
    render json: pages.map{ |page| {
      id: page.id,
      label: page.title,
      url: edit_admin_page_path(page),
    }}
  end

  private
    def check_for_lock
      if @page.locked
        redirect_to admin_pages_path, notice: 'Page cannot be deleted.'
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def setup_model
      @page = Page.from_param(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(
        :title,
        :status_id,
        :short_title,
        :sub_head,
        :copy_top,
        :copy,
        :slug,
        :redirect_to,
        :order,
        :locked,
        :in_nav,
        :meta_description,
        :gallery_id,
      )
    end
end
