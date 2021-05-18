class Attendance < ApplicationRecord  
  belongs_to :attendee, class_name: "User", foreign_key: "stripe_customer_id"
  belongs_to :event

  after_create :attendance_created

  def attendance_created
    UserMailer.attendance_email(self).deliver_now
  end
end
