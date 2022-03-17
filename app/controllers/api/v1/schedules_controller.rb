class Api::V1::SchedulesController < ApplicationController

  def index
    schedules = Schedule.all
    render json: schedules, status: :ok
  end

  def create
    schedule = Schedule.new(post_params)
    if schedule.save
      render json: schedule,  status: :created
    else
      render json: schedule, status: :internal_server_error
    end
  end

  def update
    schedule = Schedule.find(params[:id])
    schedule.update(post_params)
    render json: schedule, status: :ok
  end

  def destroy
    schedule = Schedule.find(params[:id])
    schedule.destroy!
    render json: { status: :ok, message: 'Deleted', data: schedule }
  end


  private

    def post_params
      params.require(:post).permit(:id, :name, :start, :end, :color, :timed, :long_time)
    end
end
