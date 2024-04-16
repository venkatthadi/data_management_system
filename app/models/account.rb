class Account < ApplicationRecord
  has_many :networks
  has_many :schools, :through => :networks
  has_many :users, :through => :schools
end
