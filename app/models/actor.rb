class Actor < ApplicationRecord
  has_many :mactors
  has_many :movies, through: :mactors
end
