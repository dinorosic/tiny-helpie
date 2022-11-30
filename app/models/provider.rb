# == Schema Information
#
# Table name: providers
#
#  id         :bigint           not null, primary key
#  name       :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_providers_on_name  (name) UNIQUE
#
class Provider < ApplicationRecord
  has_many :categories_providers
  has_many :categories, through: :categories_providers, dependent: :destroy

  validates :name, presence: true
  validates :url, presence: true
  validates :name, uniqueness: true
end
