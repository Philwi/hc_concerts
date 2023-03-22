# sample mutation for creating a concert
# mutation {
#  createConcert(
#  title: "Test Concert",
#  description: "This is a test concert",
#  bands: ["Test Band 1", "Test Band 2"],
#  venue: "Test Venue",
#  city: "Test City",
#  date: "2020-01-01",
#  price: "10.00",
#  )
# }
module Mutations
  class ConcertMutation < Mutations::BaseMutation
    argument :title, String, required: true
    argument :description, String, required: true
    argument :bands, [String], required: true
    argument :venue, String, required: true
    argument :city, String, required: true
    argument :date, String, required: true
    argument :price, String, required: true
    argument :image, String, required: false

    field :concert, Types::ConcertType, null: false
    field :errors, [String], null: false

    def resolve(title:, description:, bands:, venue:, city:, date:, price:, image: nil)
      result = Concerts::Create.new( title:, description:, bands:, venue:, city:, date:, price:, image:).call

      if result.success?
        {
          concert: result.success[:concert],
          errors: []
        }
      else
        {
          concert: nil,
          errors: concert.failure[:errors]
        }
      end
    end
  end
end
