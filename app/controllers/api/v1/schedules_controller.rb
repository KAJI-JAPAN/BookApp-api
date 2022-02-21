class Api::V1::SchedulesController < ApplicationController

  def index
    @schedules = Schedule.all
    render :index, status: :ok
  end

  def update
    if Schedule.exists?(id: schedule_params[:id])
      schedule = Schedule.find(schedule_params[:id])
      if schedule.update(schedule_params)
        render json: schedule, status: :created
      else
        render json: schedule, status: :bad_request
      end
    else
      schedule = PostItem.new(schedule_params) 
      if schedule.save
        render json: post, status: :created
      else
        render json: post, status: :bad_request
      end
    end
  end

  def destroy
    schedule = Schedule.find(schedule_params[:id])
    schedule.destroy!
    render json: { status: :ok, message: 'Deleted', data: schedule }
  end


  private

    def schedule_params
      params.require(:post).permit(:id, :start, :end, :color)
    end
end
