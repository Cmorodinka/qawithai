Rails.application.routes.draw do
  get 'about/index'
  get 'about', to: 'about#index'
  get 'failed_executions/index'
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
  # get 'execution/passed', to: 'execution#passed', as: 'passed'
  # get '/failed', to: 'execution#failed', as: :failed
  get 'failed_executions', to: 'failed_executions#index'
  # get 'execution/failed', to: 'execution#failed', as: 'failed'
  get 'admin/index'
end


