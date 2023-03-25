# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :concerts, [Types::ConcertType], null: false,
                                           description: 'Returns a list of concerts in the martian concert database'

    def concerts
      Concert.where('date >= ?', Time.zone.today).order(:date)
    end
  end
end
