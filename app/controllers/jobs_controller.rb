class JobsController < ApplicationController

  before_filter :careers_and_questions

  def index
    @hot_industry = false
    params[:careers] = []
    @jobs = Job.active.ordered.all
    # @paged_jobs = Job.active.ordered.all.page(params[:page]).per(10)
  end

  def show
    @job = Job.active.from_param(params[:id])

    @related_jobs = Job.related_jobs(@job)

    if @job.unpublished?
      return render_404 unless user_signed_in? && current_user.admin?
      flash.now[:alert] = "This is only visible to administrators."
    end

    render 'jobs/show'
  end

  def quiz_filter
    @results = Job.active.find_by_answers(
      params['q-0'],
      params['q-1'],
      params['q-2'],
      params['q-3']
    ).distinct.ordered

    render "jobs/quiz_results"
  end

  def search
    @results = Job.active.find_by_answers(
      params['q-0'],
      params['q-1'],
      params['q-2'],
      params['q-3']
    )

    @hot_industry = false
    if params[:hot_industry].present? 
      @results = @results.where("hot_industry = ?", true)

      if params[:hot_industry] == "hot"
        @hot_industry = true
      end
    end

    if params[:needs_certification].present?
      @results = @results.where("needs_certification = ?", true)
    end 

    unless params[:careers].blank?
      @results  = @results.find_by_filter(params[:careers].compact.reject(&:blank?))
    end
    
    @results = @results.distinct.ordered
     
    
    respond_to do |format|
      if @results
        format.html { render 'jobs/quiz_results', results: @results}
        format.js
      else
        format.html { render 'jobs/quiz_results', results: Job.active.ordered}
        format.js
      end
    end

  end

  def careers_and_questions
    @careers = Career.all
    @questions = Question.includes(:answers).all
  end
end
