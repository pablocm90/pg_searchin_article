# frozen_string_literal: true

require 'rails_helper'

RSpec.describe QueryConstructor do
  subject do
    QueryConstructor.new(**{
                                  sufficient_keywords: 'One, Harry Potter, Fantasy',
                                  insufficient_keywords: 'Big Familly, excursion, excavation',
                                  insufficient_keyword_count: 2
                                })
  end

  it 'responds to perform' do
    expect(subject).to respond_to(:sufficient_query, :insufficient_query)
  end

  context '#sufficient_query' do
    subject do
      QueryConstructor.new(**{
                                    sufficient_keywords: 'One, Harry Potter, Fantasy',
                                    insufficient_keywords: 'Big Familly, excursion, excavation',
                                    insufficient_keyword_count: 2
                                  }).sufficient_query
    end
    it { is_expected.to be_an_instance_of(String) }
    it { is_expected.to eq('One Harry<->Potter Fantasy') }
  end

  context '#insufficient_query' do
    subject do
      QueryConstructor.new(**{
                                    sufficient_keywords: 'One, Harry Potter, Fantasy',
                                    insufficient_keywords: 'Big Familly, excursion, excavation',
                                    insufficient_keyword_count: 2
                                  }).insufficient_query
    end
    it { is_expected.to be_an_instance_of(String) }
    it { is_expected.to eq('Big<->Familly&excursion Big<->Familly&excavation excursion&excavation') }
  end
end
