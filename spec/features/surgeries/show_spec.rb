require 'rails_helper'

RSpec.describe 'as a visitor', type: :feature do
  describe 'when I visit the surgery show page' do
    before(:each) do
      @hospital = Hospitial.create!(name: "Mercy")
      @doctor1 = Doctor.create!(name: "Dave", specialty: 'General', university: 'Iowa', hospitial_id: @hospital.id)
      @doctor2 = Doctor.create!(name: "Matt", specialty: 'General', university: 'Iowa', hospitial_id: @hospital.id)
      @surgery1 = Surgery.create!(title: "Knee!", day_of_week: 1, operating_room_number:2)
      @surgery2 = Surgery.create!(title: "Heart", day_of_week: 1, operating_room_number:3)
      @doctor_surgery1 = DoctorSurgery.create!(doctor_id: @doctor1.id, surgery_id: @surgery1.id)
      @doctor_surgery2 = DoctorSurgery.create!(doctor_id: @doctor1.id, surgery_id: @surgery2.id)
    end

    it 'I see a button to add a doctor to the surgery, when I add an exsisting doctor I am taken back to the surgery show and see that doctor' do
      visit surgery_path(@surgery1.id)

      click_on 'Add Doctor'

      fill_in "name", with:"#{@doctor2.name}"
      click_on "save"

      expect(current_path).to eq(surgery_path(@surgery1.id))
      expect(page).to have_content(@doctor2.name)
    end
  end
end