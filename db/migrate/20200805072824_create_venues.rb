class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.string :name, null: false
      t.string :city, null: false
      t.string :country_time_zone_identifier, null: false

      t.index %i[name city], unique: true
    end
  end
end
