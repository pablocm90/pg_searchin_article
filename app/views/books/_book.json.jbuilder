# frozen_string_literal: true

json.extract! book, :id, :synopsis, :title, :genre_id, :created_at, :updated_at
json.url book_url(book, format: :json)
