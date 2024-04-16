class Network < ApplicationRecord
  belongs_to :account
  has_many :schools
end
