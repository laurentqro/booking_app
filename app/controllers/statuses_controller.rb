class StatusesController < ApplicationController

  def show
    render json: CallCentreOpeningTimes.new(params[:date]).slots
  end
end
