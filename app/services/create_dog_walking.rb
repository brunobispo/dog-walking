class CreateDogWalking < ApplicationService
  attr_reader :dog_walking
  attr_accessor :date, :pets, :address, :address_id

  validates :date, timeliness: { datetime: true }
  validates :pets,
            numericality: { only_integers: true, greater_than_or_equal_to: 1 }

  def call
    return unless valid?
    return unless (address = find_address || create_address)

    @dog_walking = DogWalking.create!(date: @date,
                                      pets: @pets,
                                      address: address)
  end

  private

  def find_address
    Address.find(@address_id) if @address_id.present?
  end

  def create_address
    CreateAddress
      .call(@address)
      .tap { |result| errors.merge!(result.errors) unless result.success? }
      .address
  end
end
