class Account < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :networks, :dependent => :destroy
  has_many :schools, :through => :networks
  has_many :users, :through => :schools

  def self.search(search, page)
    objs = all
    objs = objs.where('name LIKE ?', "%#{search}%") if search.present?
    objs.paginate(:page => page, per_page: 5)
  end
end
