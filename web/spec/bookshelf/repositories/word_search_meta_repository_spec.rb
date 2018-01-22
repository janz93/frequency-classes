require 'spec_helper'

RSpec.describe WordSearchMetaRepository do
  # def find_by_frequency_class(frequency_class)
  #   word_search_meta.where(
  #     frequency_class: frequency_class
  #   ).map_to(WordSearchMeta).one
  # end

  it "#find_by_frequency_class" do
    word_search_meta_repository = described_class.new
    Fabricate(:word_search_meta)
    match_words = 2.times { Fabricate(:word_search_meta, frequency_class: 12) }

    byebug
    expect(
      word_search_meta_repository.find_by_frequency_class(12)
    ).to contain_exactly(match_words)
  end
end
