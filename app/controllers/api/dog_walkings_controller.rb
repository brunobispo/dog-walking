module Api
  class DogWalkingsController < ActionController::API
    def create
      return if (@result = CreateDogWalking.(dog_walking_params)).success?

      render 'api/unprocessable_entity', status: :unprocessable_entity
    end

    private

    def dog_walking_params
      params
        .require(:dog_walking)
        .permit(:pets,
                :date,
                :address_id,
                address: %i[street number complement city state])
    end
  end
end
