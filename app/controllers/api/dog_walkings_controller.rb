module Api
  class DogWalkingsController < ActionController::API
    respond_to :json
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    def index
      @result = DogWalking.order(:date)
      @result = UpcommingDogWalkingsQuery.(@result) if params.key? :upcoming

      respond_with @result
    end

    def show
      @result = DogWalking.find(params[:id])
      respond_with @result
    end

    def create
      @result = CreateDogWalking.(dog_walking_params)
      respond_with @result
    end

    def start_walk
      @result = StartDogWalking.(id: params[:id])
      respond_with @result
    end

    def finish_walk
      @result = FinishDogWalking.(id: params[:id])
      respond_with @result
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

    def render_not_found
      head :not_found
    end
  end
end
