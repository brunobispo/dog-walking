class CreateDogWalking < ActiveRecord::Migration[6.0]
  def change
    create_table :dog_walkings do |t|
      t.string :state
      t.datetime :date
      t.datetime :started_at
      t.datetime :finished_at
      t.integer :pets
      t.references :address, null: false, foreign_key: true
    end
    add_index :dog_walkings, :date
  end
end
