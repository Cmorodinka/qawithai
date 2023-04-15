Rails.application.routes.draw do
  get 'results/index'
  get 'results/show'
  get 'text_generator/index'
  resources :results, only: [:index, :show, :destroy]
  post 'text_generator/generate', to: 'text_generator#generate'
  root 'text_generator#index'
end
