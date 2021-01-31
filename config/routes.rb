# frozen_string_literal: true

Rails.application.routes.draw do
  resources :chapters
  resources :books do
    collection do
      get :search
    end
  end
  resources :genres
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
