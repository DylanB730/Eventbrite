class Event < ApplicationRecord
  belongs_to :admin, class_name: "User"
  has_many :attendances
  has_many :guests, foreign_key: 'event_id', class_name: "User", through: :attendances


  validates :start_date,
    presence: true

  validate :start_date_is_in_future?

  validates :duration,
    presence: true,
    numericality: { greater_than_or_equal_to: 0 }
  
  validate :duration_is_a_multiple_of_5?

  validates :title,
    presence: true,
    length: { in: 5..140 }

  validates :description,
    presence: true,
    length: { in: 20..1000 }

  validates :price,
    presence: true,
    numericality: true,
    inclusion: { in: 1..1000, message: "Value should be between 1 and 1000"}

  validates :location,
    presence: true

  def start_date_is_in_future?
    errors.add(:start_date, "must be in the future") unless
       self.start_date > Time.now
  end

  def duration_is_a_multiple_of_5?
    errors.add(:duration, "must be a multiple of 5") unless
    self.duration % 5 == 0
  end 

end
