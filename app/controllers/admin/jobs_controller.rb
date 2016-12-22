class Admin::JobsController < Admin::AdminController
  before_filter :set_questions

  include Adminable
  include Sortable

  def index
    @jobs = Job.page(params[:page]).per(@per_page)
    @careers = Career.all

    @career_id = params[:career_id]

    if @career_id
      @jobs = Job.find_by_filter(@career_id).page(params[:page]).per(@per_page)
    else
      @jobs = @jobs
    end
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to admin_jobs_path, notice: flash_message(@job).html_safe
    else
      render action: :new
    end
  end

  def update

    if @job.update(job_params)
      redirect_to admin_jobs_path, notice: flash_message(@job).html_safe
    else
      render action: :edit

    end
  end

  def destroy
    @job.destroy
    redirect_to admin_jobs_path, notice: 'Deleted.'
  end

  def search
    jobs = Job.skinny.search(params[:term])
    render json: jobs.map{ |job| {
      id: job.id,
      label: job.name,
      url: edit_admin_job_path(job),
    }}
  end

  def set_questions
    @questions = Question.includes(:answers).all
    @question_1 = @questions[0]
    @question_2 = @questions[1]
    @question_3 = @questions[2]
    @question_4 = @questions[3]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def setup_model
      @job = Job.from_param(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(
        :name,
        :status_id,
        :slug,
        :copy,
        :duties,
        :pay,
        :hot_industry,
        :needs_certification,
        :answer_1_id,
        :answer_2_id,
        :answer_3_id,
        :answer_4_id,
        :education_level_ids => [],
        :career_ids => [],
      )
    end

end
