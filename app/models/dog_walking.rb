# == Schema Information
#
# Table name: dog_walkings
#
#  id          :integer          not null, primary key
#  state       :string           default("scheduled")
#  date        :datetime
#  started_at  :datetime
#  finished_at :datetime
#  pets        :integer
#  address_id  :integer          not null
#

class DogWalking < ApplicationRecord
  belongs_to :address

  def started?
    started_at.present?
  end

  def finished?
    finished_at.present?
  end

  def duration
    (finished_at || Time.current) - started_at if started?
  end

  def price
    return unless started?

    aditional_pets = pets - 1

    if duration > 30.minutes
      hours = (duration / 1.hour).ceil
      (35.0 + aditional_pets * 20.0) * hours
    else
      25.0 + aditional_pets * 15.0
    end
  end
end
