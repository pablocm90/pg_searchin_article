# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :chapters, dependent: :destroy
  belongs_to :genre

  include PgSearch::Model

  pg_search_scope :book_search, 
  against: :search_column,
  ignoring: :accents,
  using: {
    tsearch: {
      any_word: true,
      dictionary: 'unaccented_english',
      tsvector_column: 'vector_search',
      highlight: {
        StartSel: '<b>',
        StopSel: '</b>',
        MaxWords: 10,
        MinWords: 4,
        ShortWord: 1,
        HighlightAll: true,
        MaxFragments: 6,
        FragmentDelimiter: '&hellip;'
      }
    }
  }

  before_save :collate_search_information

  def collate_search_information
    self.search_column = "#{title} // #{sinopsys} // #{genre.name} // #{chapters.pluck(:title).join(' // ')}"
  end
end
