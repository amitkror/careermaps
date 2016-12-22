class Admin::QuestionsController < Admin::AdminController

  include Adminable
  include Sortable

  def index
    @questions = Question.page(params[:page]).per(@per_page)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to admin_questions_path, notice: flash_message(@question).html_safe
    else
      render action: :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to admin_questions_path, notice: flash_message(@question).html_safe
    else
      render action: :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_questions_path, notice: 'Deleted.'
  end

  def search
    questions = Question.search(params[:term])
    render json: questions.map{ |question| {
      id: question.id,
      label: question.name,
      url: edit_admin_question_path(question),
    }}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def setup_model
      @question = Question.find_by_id!(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(
        :title,
        :order,
        :answer_ids => [],
      )
    end
end
