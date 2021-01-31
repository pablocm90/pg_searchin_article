# frozen_string_literal: true

class QueryConstructor
  attr_reader :sufficient_query, :insufficient_query

  def initialize(options)
    @sufficient_keywords = options[:sufficient_keywords]&.split(',')
    @insufficient_keywords = options[:insufficient_keywords]&.split(',')
    @combination_size = options[:insufficient_keyword_count]
  end

  def sufficient_query
    return if @sufficient_keywords.blank? 
    
    clean_keywords = @sufficient_keywords.uniq.reject(&:empty?)
    clean_keywords.map! do |word|
      word.strip.gsub(' ', '<->')
    end
    clean_keywords.join(' ')
  end
  
  def insufficient_query
    return if @insufficient_keywords.blank? 

    clean_keywords = @insufficient_keywords.uniq.reject(&:empty?)
    clean_keywords.map! do |word|
      word.strip.gsub(' ', '<->')
    end
    combinations = clean_keywords.combination(@combination_size.to_i).to_a
    combinations.map! do |combination|
      combination.join('&')
    end
    combinations.join(' ')
  end
end
