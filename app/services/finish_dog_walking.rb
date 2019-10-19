class FinishDogWalking < ApplicationService
  attr_accessor :id

  validate :validate_is_started
  validate :validate_is_not_finished

  def call
    return unless valid?

    @dog_walking.update(state: 'finished', finished_at: Time.current)
  end

  def dog_walking
    @dog_walking ||= DogWalking.find(@id)
  end

  private

  def validate_is_started
    errors.add(:base, :not_started) unless dog_walking.started?
  end

  def validate_is_not_finished
    errors.add(:base, :already_finished) if dog_walking.finished?
  end
end

