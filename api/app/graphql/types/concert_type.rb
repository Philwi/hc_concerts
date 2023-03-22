# frozen_string_literal: true

module Types
  # ConcertType is a GraphQL type that represents a concert
  class ConcertType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :description, String, null: true
    field :bands, [String], null: true
    field :venue, String, null: true
    field :city, String, null: true
    field :date, String, null: true
    field :price, String, null: true
    field :image, String, null: true

    def image
      Rails.application.routes.url_helpers.rails_blob_url(object.image, only_path: true) if object.image.attached?
    end
  end
end
