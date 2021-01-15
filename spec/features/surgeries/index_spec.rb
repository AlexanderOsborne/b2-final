require 'rails_helper'

RSpec.describe 'as a visor', type: :feature do
  describe 'when I visit the surgeries index' do
    before(:each) do
      @hospital = Hospitial.create!(name: "Mercy")
      @doctor1 = Doctor.create!(name: "Dave", specialty: 'General', university: 'Iowa', hospitial_id: @hospital.id)
      @doctor2 = Doctor.create!(name: "Mathews", specialty: 'General', university: 'Iowa', hospitial_id: @hospital.id)
      @surgery1 = Surgery.create!(title: "Knee!", day_of_week: 1, operating_room_number:2)
      @surgery2 = Surgery.create!(title: "C section", day_of_week: 2, operating_room_number:1)
      @surgery3 = Surgery.create!(title: "brain", day_of_week: 3, operating_room_number:4)
      @surgery4 = Surgery.create!(title: "heart", day_of_week: 1, operating_room_number:2)
      @doctor_surgery1 = DoctorSurgery.create!(doctor_id: @doctor1.id, surgery_id: @surgery1.id)
      @doctor_surgery2 = DoctorSurgery.create!(doctor_id: @doctor1.id, surgery_id: @surgery2.id)
      @doctor_surgery3 = DoctorSurgery.create!(doctor_id: @doctor2.id, surgery_id: @surgery3.id)
      @doctor_surgery4 = DoctorSurgery.create!(doctor_id: @doctor2.id, surgery_id: @surgery4.id)
    end

    it 'I see the title of all surgeries' do
      visit surgeries_path
      

      expect(page).to have_content(@surgery1.title)
      expect(page).to have_content(@surgery2.title)
      expect(page).to have_content(@surgery3.title)
      expect(page).to have_content(@surgery4.title)
      expect(page).to have_content(@doctor1.name)
      expect(page).to have_content(@doctor2.name)
    end
  end
end