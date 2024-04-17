class Account < ApplicationRecord
  validates :name, presence: true
  has_many :networks, :dependent => :destroy
  has_many :schools, :through => :networks
  has_many :users, :through => :schools
end
