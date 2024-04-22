class Network < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :account_id, presence: true
  belongs_to :account
  has_many :schools, :dependent => :destroy
  has_many :users, :through => :schools

  def self.search(search, a_id, page)
    objs = all
    objs = objs.where('name LIKE ?', "%#{search}%") if search.present?
    objs = objs.where(account_id: a_id) if a_id.present?
    objs.paginate(:page => page, per_page: 5)
  end
end
