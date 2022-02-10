# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Doctor.destroy_all
Patient.destroy_all
City.destroy_all
Appointment.destroy_all

10.times do
  city = City.create!(name: Faker::Address.city)
end

100.times do
  doctor = Doctor.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, zip_code: Faker::Address.zip_code, city_id: City.all.sample.id)
end

Specialty.create!(specialty: "Zygomaticologue")
Specialty.create!(specialty: "Casimirologue")
Specialty.create!(specialty: "Simpsonologue")
Specialty.create!(specialty: "Rigologue")
Specialty.create!(specialty: "Rirififilouloulogue")
Specialty.create!(specialty: "Gandalfologue")

100.times do
  join = JoinTableDoctorSpecialty.create!(doctor: Doctor.all.select(:id).sample, specialty: Specialty.all.select(:id).sample)
end

100.times do
  patient = Patient.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: City.all.sample.id)
end

100.times do
  appointment = Appointment.create!(doctor: Doctor.all.sample, patient: Patient.all.sample, date: Faker::Date.forward(days: 100), city_id: City.all.sample.id)
end
