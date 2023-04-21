# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# db/seeds.rb

User.create(name: "Manual Tester", email: "manual@tester.com", role: "manual_tester")
User.create(name: "Automation Tester", email: "automation@tester.com", role: "automation_tester")
User.create(name: "Team Leader", email: "team@leader.com", role: "team_leader")
