# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'characters.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')

puts 'Cleaning DB...'
Character.destroy_all

puts 'Creating users'
users = ['user1', 'user2', 'user3']
users.each do |user|
  User.create(email: "#{user}@mail.com", password: "123456")
end

puts 'Creating characters..'
csv[0...5].each do |row|
  char = Character.new
  char.name = row['name']
  char.category = row['category']
  char.description = row['description']
  char.user = User.all.sample
  char.save
end

puts "Finished! Created #{User.count} users & #{Character.count} characters."
