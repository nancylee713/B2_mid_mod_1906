require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "Validations" do
    it { should validate_presence_of :title }
    it { should validate_numericality_of :total_pages }
    it { should validate_numericality_of :publication_year }
  end

  describe "Relationships" do
    it { should have_many :author_books }
    it { should have_many(:authors).through(:author_books) }
  end
end
