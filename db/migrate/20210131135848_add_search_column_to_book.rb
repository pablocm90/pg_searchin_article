class AddSearchColumnToBook < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :search_column, :text
  end
end
