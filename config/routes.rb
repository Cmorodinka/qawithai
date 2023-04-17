Rails.application.routes.draw do
  get 'passed_executions/index'
  get 'results/index'
  get 'results/show'
  get 'text_generator/index'
  resources :results, only: [:index, :create, :show, :destroy]
  post 'text_generator/generate', to: 'text_generator#generate'
  root 'text_generator#index'
  get '/execution', to: 'execution#index'
  post 'execution', to: 'execution#create'
  get 'passed_executions', to: 'passed_executions#index'
end
