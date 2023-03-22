class AddConcerts < ActiveRecord::Migration[7.0]
  def change
    create_table :concerts do |t|
      t.string :title
      t.string :description
      t.string :bands, array: true, default: [], null: false, type: :string
      t.string :venue
      t.string :city
      t.string :date
      t.string :price
    end
  end
end
