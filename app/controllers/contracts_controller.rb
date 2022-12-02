class ContractsController < ApplicationController
  def index
    @contracts = current_account.contracts.active
  end
end
