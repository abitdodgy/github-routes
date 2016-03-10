Rails.application.routes.draw do
  resources :accounts, only: [:index, :show], path: String.new do
    resources :projects, except: [:index], path: String.new
  end
end
