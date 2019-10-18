class UpcommingDogWalkingsQuery < ApplicationQuery
  def initialize(relation = DogWalking.all)
    @relation = relation
  end

  def call
    @relation.where('date >= ?', Time.current.beginning_of_day)
  end
end
