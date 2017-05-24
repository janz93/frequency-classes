require 'csv'
require 'active_record'
require 'dotenv/load'
require_relative 'frequenz_klassen_service'

class VerbListComparisor
  def initialize(csv_path)
    @csv_table = read_csv(csv_path)
    @frequency_classes_service = FrequencyClassesService.new
  end

  def compare_databases
    @csv_table.each do |row|
      word << row['Verb']
      @deu_news_2012_1m_freqeuz_klassen_service.calculate(word)
      @deu_news_2011_300m_freqeuz_klasse_service.calculate(word)
    end
  end

  private

  def setup_database(database)
    ActiveRecord::Base.establish_connection(
      adapter:  'mysql2',
      host:     'localhost',
      username: ENV['DATABASE_USER'],
      password: ENV['DATABASE_PASSWORD'],
      database: database
    )
  end

  def compare_word(word)
    begin
      frequency_class = @frequency_classes_service.calculate(word)
    rescue NoMethodError
      frequency_class = ''
    end
    frequency_class
  end

  def read_csv(csv_path)
    CSV.read(csv_path, col_sep: ';', headers: true)
  end
end
