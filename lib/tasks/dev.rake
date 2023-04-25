namespace :dev do
  if ENV['RAILS_ENV'] != 'production'
    desc "Destroy, re-create, re-seed, and re-prime the database"
    task reprime: [
      :environment,
      "db:drop",
      "db:create",
      "db:migrate",
      "db:seed",
      "dev:prime"
    ]
  end

  desc "Hydrate the database with sample data"
  task prime: :environment do
    usernames = %w[alice bob carol dave edith frank gal harry jackie kyle ian queenie turkey]

    users = []

    usernames.each do |username|
      users << User.find_or_create_by(email:"#{username}@example.com") do |u|
        u.password = "password"
      end
    end

    users.each do |user|
      user.experiences.create(
        place: Faker::Company.name,
        started_at: Time.now - rand(4..10).years,
        ended_at: Time.now - rand(1..4).years,
        location: "#{Faker::Address.city}, #{Faker::Address.state_abbr}",
        description: Faker::GreekPhilosophers.quote,
        category: :work,
        title: Faker::Company.profession.titleize
      )
    end
  end
end
