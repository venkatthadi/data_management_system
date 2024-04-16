class User < ApplicationRecord
  validates :name, presence: true
  validates :school_id, presence: true
  validates :usertype_id, presence: true
  belongs_to :usertypes, optional: true
  belongs_to :schools, optional: true
end
