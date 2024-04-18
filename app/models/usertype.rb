class Usertype < ApplicationRecord
  has_many :users, :dependent => :destroy
  validates :name, presence: true, uniqueness: true

  def self.search(search)
    objs = all
    objs = objs.where('name LIKE ?', "%#{search}%") if search.present?
    objs
  end
end
