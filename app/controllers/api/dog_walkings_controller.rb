module Api
  class DogWalkingsController < ActionController::API
    respond_to :json

    def index
      @result = DogWalking.order(:date)
      @result = UpcommingDogWalkingsQuery.(@result) if params.key? :upcoming

      respond_with @result
    end

    def create
      @result = CreateDogWalking.(dog_walking_params)
      respond_with @result
    end

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
