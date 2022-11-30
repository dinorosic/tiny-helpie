# == Schema Information
#
# Table name: categories_providers
#
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#  provider_id :bigint           not null
#
class CategoriesProvider < ApplicationRecord
  belongs_to :provider
  belongs_to :category
end
