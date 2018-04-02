class WordRepository < Hanami::Repository
  associations do
    has_one :word_meta
  end

  def find_by_word(word)
    words.where(word: word).map_to(Word).one
  end

  def create_with_word_meta(data)
    assoc(:word_meta).create(data)
  end

  def find_with_word_meta(id)
    aggregate(:word_meta).where(id: id).map_to(Word).one
  end

  def word_meta_for(word)
    assoc(:word_meta, word).one
  end
end
