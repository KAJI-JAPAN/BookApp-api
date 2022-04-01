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

    # まとめて登録用
    # schedule_array = []
    # begin
    #   Schedule.create_schedule(post_params[:post], schedule_array)
    #   render  json: schedule_array, status: :created
    # rescue => e
    #   render e
    # end
  end

  def update
    schedule.update(post_params)
    render json: schedule, status: :ok
  end
 
  def show
    post = schedule.post
    post_item = schedule.post_item

    render json: { "schedule": schedule, "post": post }
  end
  
  def destroy
    schedule.destroy!
    render json: { status: :ok, message: 'Deleted', data: schedule }
  end
  
      # まとめて登録用
    def create_many_schedule
      schedule_array = []
      begin
        Schedule.create_schedule(post_params[:post], schedule_array)
        render  json: schedule_array, status: :created
      rescue => e
        render e
      end
    end
  
    def delete_many_schedule
    end
  

  private

    def schedule
      @schedule ||= Schedule.find(params[:id])
    end

    def post_params
      # params.require(:post).permit(:id, :name, :start, :end, :color, :timed, :long_time, :post_id, :post_item_id)
      # まとめて登録用
      params.permit(post: [:id, :name, :start, :end, :color, :timed, :long_time, :post_id, :post_item_id, :long_term_id])
    end
end
