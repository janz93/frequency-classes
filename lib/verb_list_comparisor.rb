require 'csv'
require 'frequenz_klassen_service'

class VerbListComparisor
  def initialize(csv_path)
    @csv_table = read_csv(csv_path)
    @deu_news_2012_1m_freqeuz_klassen_service = FrequenzKlassenService(
      'deu_news_2012_1M'
    )
    @deu_news_2011_300m_freqeuz_klasse_service = FrequenzKlassenService(
      'deu_news_2011_300K'
    )
  end

  def compare_databases
    @csv_table.each do |row|
      word << row['Verb']
      @deu_news_2012_1m_freqeuz_klassen_service.calculate(word)
      @deu_news_2011_300m_freqeuz_klasse_service.calculate(word)
    end
  end

  private

  def read_csv(csv_path)
    CSV.read(csv_path, col_sep: ';', headers: true)
  end
end
