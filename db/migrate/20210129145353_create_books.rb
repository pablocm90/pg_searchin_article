# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.text :sinopsys
      t.string :title
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
