class Hospitial < ApplicationRecord
  validates_presence_of :name

  has_many :doctors
end
