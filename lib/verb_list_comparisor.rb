require 'csv'
require 'active_record'
require 'dotenv/load'
require_relative 'frequenz_klassen_service'

class VerbListComparisor
  def initialize(csv_path)
    @csv_table = read_csv(csv_path)
    @frequency_classes_service = FrequencyClassesService.new
  end

  def compare_words_again_database(database)
    setup_database(database)
    @verb_list = read_csv
    @verb_list.each do |row|
      row << { database => compare_word(row['Verb']) }
    end
    append_comparison_column
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

  def append_comparison_column
    CSV.open(@csv_path, 'w', col_sep: ';') do |file|
      file << @verb_list.headers
      @verb_list.each do |row|
        file << row
      end
    end
  end

  def read_csv(csv_path)
    CSV.read(csv_path, col_sep: ';', headers: true)
  end
end
