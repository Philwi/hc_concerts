# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Concerts::Create do
  describe 'create concert' do
    let(:input_params) do
      {
        title: 'Test Concert',
        description: 'This is a test concert',
        bands: ['Test Band 1', 'Test Band 2'],
        venue: 'Test Venue',
        city: 'Test City',
        date: '2020-01-01',
        price: '10.00',
        image: Rails.root.join('spec/fixtures/test_image.png')
      }
    end

    let(:expected_response) do
      {
        title: 'Test Concert',
        description: 'This is a test concert',
        bands: ['Test Band 1', 'Test Band 2'],
        venue: 'Test Venue',
        city: 'Test City',
        date: '2020-01-01',
        price: '10.00'
      }
    end

    # TODO: fix host issue in test
    it 'returns success' do
      result = described_class.new(**input_params).call
      expect(result.success).to be_truthy
    end

    it 'returns a concert' do
      result = described_class.new(**input_params).call
      expect(result.success[:concert]).to include(expected_response)
    end
  end
end
