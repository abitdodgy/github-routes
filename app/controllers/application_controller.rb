class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_account

  def current_account
    @account ||= Account.find(params[:account_id])
  end
  alias_method :set_current_account, :current_account
end
