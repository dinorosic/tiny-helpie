module Contracts
  class BuildController < ApplicationController
    include Wicked::Wizard
    before_action :authenticate_user!

    helper_method :categories, :providers

    steps :category, :provider, :expires_at

    def show
      @contract = current_account.contracts.find(params[:contract_id])
      render_wizard(nil, {alert: "Successfully added new contract"})
    end

    def update
      @contract = current_account.contracts.find(params[:contract_id])

      @contract.update(contract_params)
      render_wizard(@contract)
    end

    def new
      @contract = current_account.contracts.create(status: "building")
      redirect_to(wizard_path(steps.first, contract_id: @contract.id))
    end

    private

    def contract_params
      status = if step == steps.last
        "active"
      else
        step
      end

      params.require(:contract).permit(:category_id, :provider_id, :started_at, :expires_at,
        :status).with_defaults(status: status)
    end

    def categories
      @categories = Category.all
    end

    def providers
      @providers = @contract.category.providers
    end
  end
end
