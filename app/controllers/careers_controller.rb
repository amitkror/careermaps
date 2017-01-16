class CareersController < ApplicationController

  def index
    redirect_to root_path
  end

  def show
    @career = Career.from_param(params[:id])
    @education = EducationLevel.all
    @jobs = @career.jobs.ordered
  end

  def search
    @career = Career.from_param(params[:id])
    @education = EducationLevel.all
    @jobs = @career.jobs.ordered

    @results = Job.active.filter_by_education(
      params[:education_levels],
      params[:career]
    )

    if params[:hot_industry].present? 
      @results = @results.where("hot_industry = ?", true)
    end

    if params[:needs_certification].present?
      @results = @results.where("needs_certification = ?", true)
    end

    @results = @results.distinct.ordered

    respond_to do |format|
      if @results
        format.html { render 'careers/show', results: @results}
        format.js
      else
        format.json { }
      end
    end
  end

end
