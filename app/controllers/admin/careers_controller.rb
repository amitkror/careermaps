class Admin::CareersController < Admin::AdminController

  include Adminable
  include Sortable

  def index
    @careers = Career.page(params[:page]).per(@per_page)
  end

  def new
    @career = Career.new
  end

  def create
    @career = Career.new(career_params)

    if @career.save
      redirect_to admin_careers_path, notice: flash_message(@career).html_safe
    else
      render action: :new
    end
  end

  def update
    if @career.update(career_params)
      redirect_to admin_careers_path, notice: flash_message(@career).html_safe
    else
      render action: :edit
    end
  end

  def destroy
    @career.destroy
    redirect_to admin_careers_path, notice: 'Deleted.'
  end

  def search
    careers = Career.skinny.search(params[:term])
    render json: careers.map{ |career| {
      id: career.id,
      label: career.name,
      url: edit_admin_career_path(career),
    }}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def setup_model
      @career = Career.from_param(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def career_params
      params.require(:career).permit(
        :name,
        :short_description,
        :about_the_field,
        :a_good_fit,
        :slug,
        :order,
        :job_ids => [],
      )
    end
end
