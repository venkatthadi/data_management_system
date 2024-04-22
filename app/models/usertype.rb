class Usertype < ApplicationRecord
  has_many :users, :dependent => :destroy
  validates :name, presence: true, uniqueness: true

  def self.search(search, page)
    objs = all
    objs = objs.where('name LIKE ?', "%#{search}%") if search.present?
    objs.paginate(:page => page, per_page: 5)
  end
end
