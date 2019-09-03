require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "Book Index Page" do
    before(:each) do
      @fyodor_dostoevsky = Author.create!(name: "Fyodor Dostoevsky")
      @crime_punishment = Book.create!(title: "Crime and Punishment", total_pages: 430, publication_year: 1866)
      @brothers_karamazov = Book.create!(title: "The Brothers Karamazov", total_pages: 824, publication_year: 1880)
      @fyodor_dostoevsky.books << @crime_punishment
      @fyodor_dostoevsky.books << @brothers_karamazov

      @ithamar_simonson = Author.create!(name: "Ithamar Simonson")
      @emmanuel_rosen = Author.create!(name: "Emmanuel Rosen")
      @absolute_value = Book.create!(title: "Absolute Value", total_pages: 256, publication_year: 2014)
      @absolute_value.authors << @ithamar_simonson
      @absolute_value.authors << @emmanuel_rosen

      @kazuo_ishiguro = Author.create!(name: "Kazuo Ishiguro")
      @remains = Book.create!(title: "The Remains of the Day", total_pages: 245, publication_year: 1989)
      @kazuo_ishiguro.books << @remains
    end

    it "shows a list of books with their info" do
      visit '/books'

      within "#book-id-#{@crime_punishment.id}" do
        expect(page).to have_content(@crime_punishment.title)
        expect(page).to have_content(@crime_punishment.total_pages)
        expect(page).to have_content(@crime_punishment.publication_year)
        expect(page).to have_content(@fyodor_dostoevsky.name)
      end

      within "#book-id-#{@remains.id}" do
        expect(page).to have_content(@remains.title)
        expect(page).to have_content(@remains.total_pages)
        expect(page).to have_content(@remains.publication_year)
        expect(page).to have_content(@kazuo_ishiguro.name)
      end

      within "#book-id-#{@absolute_value.id}" do
        expect(page).to have_content(@absolute_value.title)
        expect(page).to have_content(@absolute_value.total_pages)
        expect(page).to have_content(@absolute_value.publication_year)
        expect(page).to have_content(@ithamar_simonson.name)
        expect(page).to have_content(@emmanuel_rosen.name)
      end

    end

    it "show a link to each author of books" do
      visit '/books'

      expect(page).to have_link(@fyodor_dostoevsky.name)

      within "#book-id-#{@crime_punishment.id}" do
        click_on(@fyodor_dostoevsky.name)
      end

      expect(current_path).to eq("/authors/#{@fyodor_dostoevsky.id}")

      expect(page).to have_content(@fyodor_dostoevsky.name)
      expect(page).to have_content(@crime_punishment.title)
      expect(page).to have_content(@brothers_karamazov.title)
      expect(page).to have_content(@fyodor_dostoevsky.average_pages.to_i)
    end
  end
end
