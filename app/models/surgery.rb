class Surgery < ApplicationRecord
  validates_presence_of :title,
                       :day_of_week,
                       :operating_room_number

  has_many :doctor_surgeries
  has_many :doctors, through: :doctor_surgeries

  def dr_name
    self.doctors[0].name
  end

  def self.same_day(surgery)
    where(day_of_week: surgery.day_of_week).pluck(:title)
  end
end
