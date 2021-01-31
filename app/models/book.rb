# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :chapters, dependent: :destroy
  belongs_to :genre

  include PgSearch::Model

  pg_search_scope :book_search, 
  against: [:title, :sinopsys],
  associated_against: {
    chapters: :title,
    genre: :name
  },
  using: {
    tsearch: {
      any_word: true
    }
  }
end
