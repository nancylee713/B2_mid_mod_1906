# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Author.destroy_all
Book.destroy_all

@fyodor_dostoevsky = Author.create(name: "Fyodor Dostoevsky")
@crime_punishment = Book.create(title: "Crime and Punishment", total_pages: 430, publication_year: 1866)
@brothers_karamazov = Book.create(title: "The Brothers Karamazov", total_pages: 824, publication_year: 1880)
@fyodor_dostoevsky.books << @crime_punishment
@fyodor_dostoevsky.books << @brothers_karamazov

@ithamar_simonson = Author.create(name: "Ithamar Simonson")
@emmanuel_rosen = Author.create(name: "Emmanuel Rosen")
@absolute_value = Book.create(title: "Absolute Value", total_pages: 256, publication_year: 2014)
@absolute_value.authors << @ithamar_simonson
@absolute_value.authors << @emmanuel_rosen

@kazuo_ishiguro = Author.create(name: "Kazuo Ishiguro")
@remains = Book.create(title: "The Remains of the Day", total_pages: 245, publication_year: 1989)
@kazuo_ishiguro.books << @remains
