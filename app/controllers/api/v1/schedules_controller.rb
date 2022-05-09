class Api::V1::SchedulesController < ApplicationController
  before_action :authenticate_api_v1_user!
  def index
    schedules = current_api_v1_user.schedules
    render json: schedules, status: :ok

  end

  def create
      schedule = Schedule.new(post_params)
      schedule.user_id = current_api_v1_user.id
      if schedule.save
        render json: schedule,  status: :created
      else
        render json: schedule, status: :internal_server_error
    end
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
    render json: { status: :no_content, message: 'Deleted', data: schedule }
  end
  
    # まとめて登録用
    def create_many_schedule
      schedule_array = []
      begin
        Schedule.create_schedule(schedule_params[:post], schedule_array, current_api_v1_user.id)
        render  json: schedule_array, status: :created
      rescue => e
        render e
      end
    end
  
    # まとめて削除用
    def delete_many_schedule
      params= schedule.long_term_id
      if Schedule.where(long_term_id: params).destroy_all
        render json: {}, status: :no_content
      else
        render json: schedule, status: :internal_server_error
      end
    end
  

  private

    def schedule
      @schedule ||= Schedule.find(params[:id])
    end

    def schedule_params
      params.permit(post: [:id, :name, :start, :end, :color, :timed, :long_time, :post_id, :long_term_id])
    end

    def post_params
      params.require(:post).permit(:id, :name, :start, :end, :color, :timed, :long_time, :post_id)
    end
end
