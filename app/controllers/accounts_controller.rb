class AccountsController < ApplicationController
  def index
    @accounts = Account.all
  end

  def show
    @account = Account.find(params[:id])
  end

  def edit
    @account = Account.find(params[:id])
  end
end
