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
end
