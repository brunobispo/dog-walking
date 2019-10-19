class ChangeDogWalkingStateDefaultValue < ActiveRecord::Migration[6.0]
  def change
    change_column_default :dog_walkings, :state, from: nil, to: 'scheduled'
  end
end
