# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::ConcertMutation, type: :request do
  describe 'create concert' do
    let(:query) do
      <<~GQL
        mutation {
          createConcert(
            title: "Test Concert",
            description: "This is a test concert",
            bands: ["Test Band 1", "Test Band 2"],
            venue: "Test Venue",
            city: "Test City",
            date: "2020-01-01",
            price: "10.00",
          )
        }
      GQL
    end

    let(:expected_response) do
      {
        data: {
          createConcert: {
            title: 'Test Concert',
            description: 'This is a test concert',
            bands: ['Test Band 1', 'Test Band 2'],
            venue: 'Test Venue',
            city: 'Test City',
            date: '2020-01-01',
            price: '10.00'
          }
        }
      }
    end

    before do
      post '/graphql', params: { query: }
    end

    # TODO: fix host issue in test
    it 'returns a concert' do
      json = JSON.parse(response.body)
      data = json['data']['createConcert']
      expect(data).to include(expected_response[:data][:createConcert])
    end
  end
end
