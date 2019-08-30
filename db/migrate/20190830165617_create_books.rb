class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :total_pages
      t.integer :publication_year
    end
  end
end
