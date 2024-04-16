class Network < ApplicationRecord
  validates :name, presence: true
  validates :account_id, presence: true
  belongs_to :account
  has_many :schools
  has_many :users, :through => :schools
end
