Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'scores', to: 'course#score', as: 'scores'
  get 'staffsummary', to: 'course#staffsummary', as: 'staffsummary'
  get 'course_info', to: 'course#course_info', as: 'course_info'
  get 'resources', to: 'course#resources', as: 'resources'
  post 'import', to: 'autograder#import'
  post 'import_lab', to: 'autograder#import_lab'

  resources :sessions, only: [:create, :destroy]
  resource :course, only: [:home]

  root to: 'course#home'
end
