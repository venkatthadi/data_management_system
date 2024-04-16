class Network < ApplicationRecord
  belongs_to :account
  has_many :schools
  has_many :users, :through => :schools
end
