# frozen_string_literal: true

module Concerts
  class Create
    # Create is a service object that creates a concert
    class Contract < Dry::Validation::Contract
      params do
        required(:title).filled(:string)
        required(:description).filled(:string)
        required(:bands).filled(:array)
        required(:venue).filled(:string)
        required(:city).filled(:string)
        required(:date).filled(:string)
        required(:price).filled(:string)
        optional(:image).maybe(:string)
      end

      rule(:bands).each do
        key.failure('must be a string') unless value.is_a?(String)
      end

      rule(:image).validate do
        key.failure('must be a string') if value && !value.is_a?(String)
      end
    end
  end
end
