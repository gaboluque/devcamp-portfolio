# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |topic|
  Topic.create!(
    title: "Topic #{topic + 1}"
  )
end

puts '3 topics created'

10.times do |blog|
  Blog.create!(
    title: "My blog post #{blog + 1}",
    body: 'Lorem ipsum dolorsir voluptatem totam rem aperiam, nemo emin ipsam',
    topic_id: Topic.last.id
  )
end

puts '10 blog posts created'

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill + 1}",
    percent_utilized: 15
  )
end

puts '5 skills created'

8.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio #{portfolio_item + 1}",
    subtitle: 'Ruby on Rails',
    body: 'Lorem ipsum dolorsir voluptatem totam rem aperiam, nemo emin ipsam',
    main_image: 'https://picsum.photos/600/400',
    thumb_image: 'https://picsum.photos/350/200'
  )
end

1.times do
  Portfolio.create!(
    title: 'Portfolio 9',
    subtitle: 'ReactJS',
    body: 'Lorem ipsum dolorsir voluptatem totam rem aperiam, nemo emin ipsam',
    main_image: 'https://picsum.photos/600/400',
    thumb_image: 'https://picsum.photos/350/200'
  )
end

puts '9 portfolio items created'

3.times do |technology|
  Portfolio.last.technologies.create!(
    name: "Technology #{technology + 1}"
  )
end

puts '3 technologies created'
