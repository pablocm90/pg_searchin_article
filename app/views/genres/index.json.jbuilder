# frozen_string_literal: true

json.array! @genres, partial: 'genres/genre', as: :genre
