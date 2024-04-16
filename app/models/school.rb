class School < ApplicationRecord
  belongs_to :network
  has_many :users
end
