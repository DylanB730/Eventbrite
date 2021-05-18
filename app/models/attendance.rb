class Attendance < ApplicationRecord
  after_create :report_admin_send

  belongs_to :guest, class_name: "User"
  belongs_to :event



  def report_admin_send
    AdminMailer.report_admin_email(self.event.admin).deliver_now
  end


end
