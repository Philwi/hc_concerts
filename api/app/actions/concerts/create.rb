# frozen_string_literal: true

module Concerts
  class Create
    include Dry::Monads[:result]

    private

    attr_reader :title, :description, :bands, :venue, :city, :date, :price, :image

    public

    # rubocop:disable Metrics/ParameterLists
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
    # rubocop:enable Metrics/ParameterLists

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
      concert = create_record(input)
      concert = add_image_to_concert(concert:, image: input[:image])

      if concert.save
        Success(concert:)
      else
        Failure(errors: :concert_not_created)
      end
    end

    def create_record(input)
      input = input.success

      Concert.new(
        title: input[:title],
        description: input[:description],
        artist: input[:artist],
        label: input[:label],
        release_date: input[:release_date],
        price: input[:price]
      )
    end

    def add_image_to_concert(concert:, image:)
      return concert unless image

      concert.image.attach(io: StringIO.new(Base64.decode64(image)), filename: 'image.png', content_type: 'image/png')
      concert
    end
  end
end
