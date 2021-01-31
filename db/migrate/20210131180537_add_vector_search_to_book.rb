class AddVectorSearchToBook < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :vector_search, :tsvector
  end
end
