# == Schema Information
#
# Table name: dog_walkings
#
#  id          :integer          not null, primary key
#  state       :string
#  date        :datetime
#  started_at  :datetime
#  finished_at :datetime
#  pets        :integer
#  address_id  :integer          not null
#
# Indexes
#
#  index_dog_walkings_on_address_id  (address_id)
#  index_dog_walkings_on_date        (date)
#

class DogWalking < ApplicationRecord
end
