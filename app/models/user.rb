class User < ApplicationRecord
  after_create :welcome_send

  has_many :events, foreign_key: 'admin_id', class_name: 'Event'
  has_many :attendances, foreign_key: 'guest_id', class_name: 'Attendance'

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end

