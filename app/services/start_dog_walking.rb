class StartDogWalking < ApplicationService
  attr_accessor :id

  validate :validate_is_not_started

  def call
    return unless valid?

    @dog_walking.update(state: 'started', started_at: Time.current)
  end

  def dog_walking
    @dog_walking ||= DogWalking.find(@id)
  end

  private

  def validate_is_not_started
    errors.add(:base, :already_started) if dog_walking.started?
  end
end

