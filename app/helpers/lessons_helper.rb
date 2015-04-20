module LessonsHelper
  def create_question word
    collection_radio_buttons(:answer, word.id, word.answers, :id, :text) do |b|
    end
  end

end
