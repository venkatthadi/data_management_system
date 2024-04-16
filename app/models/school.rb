class School < ApplicationRecord
  validates :name, presence: true
  validates :network_id, presence: true
  belongs_to :network
  has_many :users
end
