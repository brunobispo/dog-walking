class CreateAddress < ApplicationService
  attr_reader :address
  attr_accessor :street, :number, :complement, :city, :state

  validates :street, :city, presence: true
  validates :state, length: { is: 2 }
  validate :validate_coordinates

  def call
    return unless valid?

    @address = Address.create!(street: @street,
                               number: @number,
                               complement: @complement,
                               city: @city,
                               state: @state,
                               latitude: coordinates.latitude,
                               longitude: coordinates.longitude)
  end

  private

  def coordinates
    @coordinates ||= Geocoder.search("#{@street}, #{@number}")[0]
  end

  def validate_coordinates
    errors.add(:street, :invalid) unless coordinates.present?
  end
end
