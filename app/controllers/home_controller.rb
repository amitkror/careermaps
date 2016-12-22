class HomeController < ApplicationController

  def index
    @careers = Career.active.all
    @questions = Question.includes(:answers).all.ordered
  end

end
