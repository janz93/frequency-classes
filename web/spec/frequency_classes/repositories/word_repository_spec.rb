RSpec.describe WordRepository, type: :repository do
  it "#find_by_word" do
    word_repository = described_class.new
    hello = Fabricate(:word, word: "hello")

    expect(word_repository.find_by_word("hello")).to eq hello
  end
end
