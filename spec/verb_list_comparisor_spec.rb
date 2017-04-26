require 'verb_list_comparisor'

describe VerbListComparisor do
  let(:csv_path) { 'test-verb-list.csv' }
  subject(:verb_list_comparisor) { VerbListComparisor.new(csv_path) }

  describe '#compare_databases' do
    context 'when logged in' do
      it 'should return a comparion of the verb for each database' do
        expected_result = '
          Verb;Frequenzklasse;deu_news_2012_1M;deu_news_2011_300K;
          haben;3;3;3;werden;3;3;3;sein;3;3;3;
        '
        expect(verb_list_comparisor.compare_databases).to eq expected_result
      end
    end
  end
end
