require 'rails_helper'

RSpec.describe Surgery, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title}
    it { should validate_presence_of :day_of_week}
    it { should validate_presence_of :operating_room_number}
  end

  describe 'relationships' do
    # it {should belong_to :}
    it {should have_many :doctor_surgeries}
    it { should have_many(:doctors).through(:doctor_surgeries) }
  end

  describe 'instance methods' do
    it 'should return Drs name' do
      @hospital = Hospitial.create!(name: "Mercy")
      @doctor1 = Doctor.create!(name: "Dave", specialty: 'General', university: 'Iowa', hospitial_id: @hospital.id)
      @surgery1 = Surgery.create!(title: "Knee!", day_of_week: 1, operating_room_number:2)
      @doctor_surgery1 = DoctorSurgery.create!(doctor_id: @doctor1.id, surgery_id: @surgery1.id)
      
      expect(@surgery1.dr_name).to eq("Dave")
    end
  end
end
