# frozen_string_literal: true

# Concert model
class Concert < ApplicationRecord
  has_one_attached :image
end
