require 'frequency_classes_service'

describe 'FrequencyClassesService' do
  let(:frequency_classes_service) { FrequencyClassesService.new }
  let(:sample_word) { 'haben' }

  describe '#initialize' do
    it 'should return a FrequencyClassesService instance' do
      expect(frequency_classes_service).to be_instance_of(
        FrequencyClassesService
      )
    end
  end

  describe '#calculate' do
    it 'should calculate the frequency class for haben to match 3' do
      expect(frequency_classes_service.calculate(sample_word)).to eq 3
    end
  end
end
