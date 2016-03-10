Rails.application.routes.draw do
  # scope ':account_id' do
  #   resource :account, path: '', only: [] do
  #     resources :projects, path: ''
  #   end
  # end
  # resource :account, path: ''

  resources :accounts, path: String.new
  resources :accounts, only: [], path: String.new do
    resources :projects, except: [:index], path: String.new
  end

  root to: 'accounts#index'
end
