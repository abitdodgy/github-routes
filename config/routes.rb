Rails.application.routes.draw do
  resources :accounts, path: String.new
  resources :accounts, only: [], path: String.new do
    resources :projects, except: [:index], path: String.new
  end
end
