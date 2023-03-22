# frozen_string_literal: true

module Concerts
  class Create
    include Dry::Monads[:result]

    private

    attr_reader :title, :description, :bands, :venue, :city, :date, :price, :image

    public

    def initialize(title:, description:, bands:, venue:, city:, date:, price:, image:)
      @title = title
      @description = description
      @bands = bands
      @venue = venue
      @city = city
      @date = date
      @price = price
      @image = image
    end

    def call
      result = validate_params
      result = create_concert(result) if result.success?

      result
    end

    private

    def validate_params
      result = Concerts::Create::Contract.new.call(title:, description:, bands:, venue:, city:, date:, price:, image:)
      if result.success?
        Success(result)
      else
        Failure(errors: result.errors)
      end
    end

    def create_concert(input)
      input = input.success

      concert = Concert.new(
        title: input[:title],
        description: input[:description],
        bands: input[:bands],
        venue: input[:venue],
        city: input[:city],
        date: input[:date],
        price: input[:price]
      )

      if image
        concert.image.attach(io: StringIO.new(Base64.decode64(input[:image])), filename: 'image.png', content_type: 'image/png')
      end

      if concert.save
        Success(concert:)
      else
        Failure(errors: :concert_not_created)
      end
    end
  end
end
