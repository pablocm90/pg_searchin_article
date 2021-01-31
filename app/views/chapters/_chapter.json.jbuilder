# frozen_string_literal: true

json.extract! chapter, :id, :book_id, :title, :created_at, :updated_at
json.url chapter_url(chapter, format: :json)
