module CategoriesHelper
  def learned_word(category, user)
    'Learned ' + category.count_learned_word(user).to_s + '/' + category.words.count.to_s + ' words'
  end
end
