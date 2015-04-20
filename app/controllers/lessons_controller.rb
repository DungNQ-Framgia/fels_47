class LessonsController < ApplicationController
  def create
    answers = params[:answer]
    count = 0
    answers.each do |answer|
      learnedWord = LearnedWord.find_or_initialize_by(
        user_id: current_user.id,
        word_id: answer.first,
      )
      if Answer.find(answer.second).correct
        learnedWord.learned = true
        count += 1 
      else
        learnedWord.learned = false
      end
      learnedWord.save
    end
    @mark = count
    Lesson.create!(
      user_id: current_user.id,
      category_id: params[:category_id],
      lesson_type: params[:lesson][:type],
      results_attributes: [
        {user_id: current_user.id,
        content: params[:answer].to_json,
        mark: @mark}
      ]
    )
  end

  def show
  end

  def index
  end

  def new
    @type = params[:type]
    @category = Category.find(params[:category_id])
    @words = @category.generate_lesson(current_user, @type)
  end
end
