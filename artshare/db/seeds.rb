# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
u1 = User.create(username: "u1")
u2 = User.create(username: "u2")
u3 = User.create(username: "u3")
u4 = User.create(username: "u4")
u5 = User.create(username: "u5")

Artwork.destroy_all
a1 = Artwork.create(title: "a1", image_url: "/al", artist_id: u1.id)
a2 = Artwork.create(title: "a2", image_url: "/a2", artist_id: u1.id)
a3 = Artwork.create(title: "a3", image_url: "/a3", artist_id: u2.id)

ArtworkShare.destroy_all
as1 = ArtworkShare.create(artwork_id: a1.id, viewer_id: u1.id)
as2 = ArtworkShare.create(artwork_id: a1.id, viewer_id: u3.id)
as3 = ArtworkShare.create(artwork_id: a2.id, viewer_id: u3.id)

Comment.destroy_all
c1 = Comment.create(body: "c1", user_id: u1.id, artwork_id: a1.id)
c2 = Comment.create(body: "c2", user_id: u2.id, artwork_id: a1.id)
c3 = Comment.create(body: "c3", user_id: u1.id, artwork_id: a2.id)
c4 = Comment.create(body: "c4", user_id: u4.id, artwork_id: a3.id)
