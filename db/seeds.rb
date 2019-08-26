# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#


10.times do |i|
  Candidate.create(
    name: Faker::Name.name, 
    party: Faker::TvShows::GameOfThrones.house, 
    degree: ["junier high", "senier high", "universuty", "smoke and drink","PHD"].sample,
    age: Faker::Number.between(from: 40, to: 65), 
    policy: Faker::TvShows::GameOfThrones.quote )
end