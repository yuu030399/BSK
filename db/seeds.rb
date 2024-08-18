# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.find_or_create_by!(brand_name: "NIKE")
Category.find_or_create_by!(brand_name: "UNDER ARMOUR")
Category.find_or_create_by!(brand_name: "JORDAN")
Category.find_or_create_by!(brand_name: "asics")
Category.find_or_create_by!(brand_name: "その他")