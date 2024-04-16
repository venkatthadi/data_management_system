class User < ApplicationRecord
  belongs_to :usertypes
  belongs_to :schools
end
