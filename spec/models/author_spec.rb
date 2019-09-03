require 'rails_helper'

RSpec.describe Author, type: :model do
  describe "Validations" do
    it { should validate_presence_of :name }
  end

  describe "Relationships" do
    it { should have_many :author_books }
    it { should have_many(:books).through(:author_books) }
  end

  describe "instance methods" do
    it "can calculate average number of pages for all books of an author" do
      fyodor_dostoevsky = Author.create!(name: "Fyodor Dostoevsky")
      crime_punishment = fyodor_dostoevsky.books.create!(title: "Crime and Punishment", total_pages: 430, publication_year: 1866)
      brothers_karamazov = fyodor_dostoevsky.books.create!(title: "The Brothers Karamazov", total_pages: 824, publication_year: 1880)

      expect(fyodor_dostoevsky.average_pages).to eq(627)
    end
  end
end
