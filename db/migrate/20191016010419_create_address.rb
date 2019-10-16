class CreateAddress < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :number
      t.string :complement
      t.string :city
      t.string :state
      t.decimal :latitude
      t.decimal :longitude
    end
  end
end
