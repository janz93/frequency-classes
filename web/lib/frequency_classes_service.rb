require_relative 'word'

class FrequencyClassesService
  def calculate(word)
    search_word = Words.find_by_word(word)
    Math.log2(most_common_word.freq / search_word.freq).round
  end

  private

  def most_common_word
    Words.where("word REGEXP '^[a-zA-Z]'").order(freq: :desc).first
  end
end
