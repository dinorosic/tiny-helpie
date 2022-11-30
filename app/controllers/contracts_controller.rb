class ContractsController < ApplicationController
  def index
    @contracts = current_account.contracts
  end
end
