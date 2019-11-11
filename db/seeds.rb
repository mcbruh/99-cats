# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cats_list = [
    ['Skittles', '2005/10/23', 'blue/grey', 'F', "cutest cat"],
    ['Hemi', '2019/11/20', 'white', 'M', 'always hungry'],
    ['Oldie', '2015/06/15', 'black', 'M', 'bites feet at 6 am'],
    ['Benny', '2017/02/14', 'ginger', 'M', 'knocks over chairs']
]

cats_list.each do |name, birth_date, color, sex, description|
    Cat.create(name: name, birth_date: birth_date, color: color, sex: sex, description: description)
end