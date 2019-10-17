class CreateDogWalking < ApplicationService
  attr_reader :dog_walking
  attr_accessor :date, :pets, :address

  validates :date, timeliness: { datetime: true }
  validates :pets,
            numericality: { only_integers: true, greater_than_or_equal_to: 1 }

  def initialize(date:, pets:, address:)
    @date = date
    @pets = pets
    @address = address
  end

  def call
    return unless valid?

    address = Address.new(@address)
    @dog_walking = DogWalking.create!(date: @date,
                                      pets: @pets,
                                      address: address)
  end
end
