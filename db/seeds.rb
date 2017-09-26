# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cats = Cat.create([
    {name: 'Moe', breed: 'Taby', weight: 'fat', temperament: 'entitled'},
    {name: 'Ciprian', breed: 'Calico', weight: 'skinny', temperament: null}
])

hobbies = Hobby.create([
    {name: 'eating'},
    {name: 'playing'}
])

CatHobby.create([
    {cat: cats.first, hobby: hobbies.first},
    {cat: cats.last, hobbby: hobbies.last}
])