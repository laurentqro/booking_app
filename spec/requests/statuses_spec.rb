require 'rails_helper'

RSpec.describe StatusesController, :type => :request do
  describe 'GET show' do
    let(:date) { '2029-08-24' }

    subject { get "/status/#{date}" }

    before do
      service = double CallCentreOpeningTimes, slots: expected_response_hash
      expect(CallCentreOpeningTimes).to receive(:new).with(date).and_return(service)
      subject
    end

    it 'returns success' do
      expect(response).to have_http_status(200)
    end

    it 'returns the expected response hash as JSON' do
      expect(response.body).to eq expected_response_hash.to_json
    end

    def expected_response_hash
      {
        date: date,
        slots: {
          first: '09:00',
          last: '17:30'
        },
        interval: '00:30'
      }
    end

  end

  describe 'GET request_slot' do
    let(:date_time) { '2029-08-24T11:45' }

    subject { get "/slot/#{date_time}" }

    before do
      service = double CallCentreOpeningTimes, next_available_slot: expected_response_hash
      expect(CallCentreOpeningTimes).to receive(:new).with(date_time).and_return(service)
      subject
    end

    it 'returns success' do
      expect(response).to have_http_status(200)
    end

    it 'returns the expected response hash as JSON' do
      expect(response.body).to eq expected_response_hash.to_json
    end

    def expected_response_hash
      {
        requested_date_time: date_time,
        next_available_slot: "2029-08-24T12:00"
      }
    end
  end
end
