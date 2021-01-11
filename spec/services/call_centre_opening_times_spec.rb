require 'rails_helper'

RSpec.describe CallCentreOpeningTimes do
  describe '#slots' do
    subject { CallCentreOpeningTimes.new(date).slots }

    context 'Monday' do
      let(:date) { '2020-08-24' }

      it 'returns the expected date' do
        expect(subject[:date]).to eq date
      end

      it 'returns the exected interval' do
        expect(subject[:interval]).to eq '00:30'
      end

      it 'returns the expected first and last slots' do
        expect(subject[:slots][:first]).to eq '11:00'
        expect(subject[:slots][:last]).to eq '17:30'
      end
    end

    context 'Sunday' do
      let(:date) { '2020-08-23' }
      it 'returns the expected first and last slots' do
        expect(subject[:slots][:first]).to be nil
        expect(subject[:slots][:last]).to be nil
      end
    end

    context 'Saturday' do
      let(:date) { '2020-08-22' }
      it 'returns the expected first and last slots' do
        expect(subject[:slots][:first]).to eq '09:00'
        expect(subject[:slots][:last]).to eq '12:30'
      end
    end
  end
end
