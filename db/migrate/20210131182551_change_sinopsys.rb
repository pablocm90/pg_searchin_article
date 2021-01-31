class Changesynopsis < ActiveRecord::Migration[6.0]
  def change
    rename_column :books, :sinopsys, :sinopsys
  end
end
