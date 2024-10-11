# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Create 50 posts
# 
50.times do |i|
  Post.create(
    title: "Post #{i + 1}",
    text: "This is the text of the post #{i + 1}",
    cover: "https://picsum.photos/seed/#{i + 1}/800/600",
    author_id: User.first.id
  )
end