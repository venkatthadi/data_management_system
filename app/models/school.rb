class School < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :network_id, presence: true
  belongs_to :network
  has_many :users, :dependent => :destroy

  def self.search(search, n_id, a_id, page)
    objs = all
    objs = objs.where('name LIKE ?', "%#{search}%") if search.present?
    objs = objs.where(network_id: n_id) if n_id.present?
    objs = objs.joins(:network).where(networks: {account_id: a_id}) if a_id.present?
    objs.paginate(:page => page, per_page: 5)
  end
end
