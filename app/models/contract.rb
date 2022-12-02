# == Schema Information
#
# Table name: contracts
#
#  id          :bigint           not null, primary key
#  expires_at  :datetime
#  notified    :boolean          default(FALSE)
#  status      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  account_id  :bigint
#  category_id :bigint
#  provider_id :bigint
#
# Indexes
#
#  index_contracts_on_account_id   (account_id)
#  index_contracts_on_category_id  (category_id)
#  index_contracts_on_provider_id  (provider_id)
#
class Contract < ApplicationRecord
  acts_as_tenant :account

  belongs_to :provider, optional: true
  belongs_to :category, optional: true

  scope :active, -> { where(status: "active") }

  def name
    "#{category.name} with #{provider.name}"
  end

  def active?
    status == "active"
  end

  def active_or_category?
    status.include?("category") || active?
  end

  def active_or_provider?
    status.include?("provider") || active?
  end

  def active_or_started_at?
    status.include?("started_at") || active?
  end

  def active_or_expires_at?
    status.include?("expires_at") || active?
  end
end
