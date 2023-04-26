# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

emails = %w[
  ian@biggreen.company
]

emails.each do |email|
  user = User.find_or_create_by(email: email) do |u|
    u.password = "password"
  end
  user.add_role :admin
end
