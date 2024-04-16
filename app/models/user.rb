class User < ApplicationRecord
  belongs_to :usertypes, optional: true
  belongs_to :schools, optional: true
end
