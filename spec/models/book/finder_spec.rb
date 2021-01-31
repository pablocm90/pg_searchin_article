require 'rails_helper'

RSpec.describe Book::Finder do
  describe 'Book::Finder#sufficients' do
    context 'finds books based on sufficient keywords' do
      context 'finds if the keyword is in the book title' do
        let(:genre) { Genre.create(name: 'Lorem Ipsum') }
        let(:book) { Book.create!(title: 'Harry Potter and the philosopher stone', sinopsys: 'I am groot', genre: genre, chapters: chapter) }
        let(:chapter) {
          [Chapter.new(title: 'And then there was one')]
        }
        let(:incorrect_query) { 'Captain America, Ironman, Spiderman'}
        let(:correct_queries) do 
          ['Lorem Ipsum', 'Harry','there', 'was one', 'philosopher stone', 'groot', 'Ipsum', 'And']
        end
        it 'is empty on an incorrect query' do 
          query_constructor = double(:query_constructor, 
            {
              sufficient_query: incorrect_query,
              insufficient_query: nil
            }
          )
          book_search = Book::Finder.new(query_constructor)
          expect(book_search.sufficients).to be_empty
        end
        it 'finds book for correct queries' do 
          20.times do 
            query = correct_queries.sample(rand(9) + 1).join(', ')
            query_constructor = double(:query_constructor, 
              {
                sufficient_query: query,
                insufficient_query: nil
              }
            )
            book_search = Book::Finder.new(query_constructor)

            expect(book_search.sufficients).to include(book)
          end
        end
      end
    end
  end
  describe 'Book::Finder#insufficients' do
    context 'finds books based on sufficient keywords' do
      context 'finds if the keyword is in the book title' do
        let(:genre) { Genre.create(name: 'Lorem Ipsum') }
        let(:book) { Book.create!(title: 'Harry Potter and the philosopher stone', sinopsys: 'I am groot', genre: genre, chapters: chapter) }
        let(:chapter) {
          [Chapter.new(title: 'And then there was one')]
        }
        let(:incorrect_keywords) { ['Captain America', 'Harry', 'Spiderman']}
        let(:correct_keywords) do 
          ['Lorem Ipsum', 'Harry','there', 'was one', 'philosopher stone', 'groot', 'Ipsum', 'And']
        end
        it 'is empty on an incorrect query' do 
          5.times do 
            incorrect_query = (incorrect_keywords.sample(2) << correct_keywords.sample).join(', ')
            query_constructor = QueryConstructor.new(**{
              insufficient_keywords: incorrect_query,
              insufficient_keyword_count: 2
            })
            book_search = Book::Finder.new(query_constructor)
            expect(book_search.insufficients).to be_empty
          end
        end
        it 'finds book for correct queries' do 
          20.times do 
            incorrect_query = (incorrect_keywords.sample(2) + correct_keywords.sample(3)).join(', ')
            query_constructor = QueryConstructor.new(**{
              insufficient_keywords: incorrect_query,
              insufficient_keyword_count: 2
            })
            book_search = Book::Finder.new(query_constructor)
            expect(book_search.insufficients).to include(book)
          end
        end
      end
    end
  end
end