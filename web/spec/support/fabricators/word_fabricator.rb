Fabricator(:word) do
  word "hallo"
  word_ci "hallo"
  freq 1234
  word_meta { Fabricate(:word_meta) }
end
