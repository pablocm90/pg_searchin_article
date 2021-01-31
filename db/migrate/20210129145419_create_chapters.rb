# frozen_string_literal: true

class CreateChapters < ActiveRecord::Migration[6.0]
  def change
    create_table :chapters do |t|
      t.references :book, null: false, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
