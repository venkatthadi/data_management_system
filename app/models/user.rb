class User < ApplicationRecord
  validates :name, presence: true
  validates :school_id, presence: true
  validates :usertype_id, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\Z/, message: "invalid form"}
  validates :phone, presence: true, length: { is: 10 }
  belongs_to :usertype, optional: true
  belongs_to :school, optional: true
  has_one :network, through: :school

  def self.search(search, s_id, ut_id, n_id, a_id, page)
    objs = all
    objs = objs.where('name LIKE ?', "%#{search}%") if search.present?
    objs = objs.where(school_id: s_id) if s_id.present?
    objs = objs.where(usertype_id: ut_id) if ut_id.present?
    objs = objs.joins(:school).where(schools: { network_id: n_id }) if n_id.present?
    # objs = objs.joins(:school {network: :account}).where(accounts: { id: a_id }) if a_id.present?
    objs.paginate(:page => page, per_page: 5)
  end
end
