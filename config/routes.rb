# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users', to: 'users#index'
  get 'users/:user_id/posts', to: 'posts#index'
  get 'users/:user_id/posts/:id', to: 'posts#show'
  get 'users/:id', to: 'users#show'
end
