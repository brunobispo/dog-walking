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
end
