class SlotsController < ApplicationController

  def show
    render json: CallCentreOpeningTimes.new(params[:date_time]).next_available_slot
  end
end
