class User < ApplicationRecord
  validates :name, presence: true
  validates :school_id, presence: true
  validates :usertype_id, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\Z/, message: "invalid form"}
  validates :phone, presence: true, uniqueness: true, length: { is: 10 }
  belongs_to :usertypes, optional: true
  belongs_to :schools, optional: true

  def self.search(search, s_id, ut_id)
    objs = all
    objs = objs.where('name LIKE ?', "%#{search}%") if search.present?
    objs = objs.where(school_id: s_id) if s_id.present?
    objs = objs.where(usertype_id: ut_id) if ut_id.present?
    objs
  end
end
