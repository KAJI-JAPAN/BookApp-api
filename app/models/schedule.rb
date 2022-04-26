class Schedule < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :post_item, optional: true
  belongs_to :post, optional: true
  validates :start, presence: true
  validates :end, presence: true

  def self.create_schedule(params, array, current_user_id)
    # 送られてきた複数のイベントを保存
    index = Schedule.order(created_at: :desc).limit(1).ids.sum(1)
    Schedule.transaction do
      params.each do |data|
        schedule = Schedule.new(data)
        # schedule[:long_term_id] = index 
        schedule.save!
        array.push(schedule)
      end

    # イベントにidを付与
      array.each do |data|
        data.long_term_id = index
        data.user_id = current_user_id
        data.save!
      end
      return array
    end
  end 
end
