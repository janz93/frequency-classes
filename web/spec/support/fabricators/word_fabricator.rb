Fabricator(:word) do
  word "hallo"
  word_ci "hallo"
  freq 1234
  word_search_meta { Fabricate.build(:word_search_meta) }
end
