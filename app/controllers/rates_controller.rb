class RatesController < ApplicationController
    include RatesHelper
    before_action :authorize_request

    def index
        if check_missing(rate_params)
            render json: {error: "Missing data in requested time frame, try again in few seconds"}, status: :unprocessable_entity
        else
            @rates = Currency.includes(:day).where(code: rate_params[:code], day: {date: @date_from..@date_to}).average(:value).to_f
            render json: {avg: @rates}, status: :created
        end
    end

    private 

    def rate_params
        params.permit(
          :date_from, :date_to, :code
        )
    end
end
