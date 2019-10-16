# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  street     :string
#  number     :string
#  complement :string
#  city       :string
#  state      :string
#  latitude   :decimal(, )
#  longitude  :decimal(, )
#

class Address < ApplicationRecord
end
