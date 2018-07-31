class Sprint < ApplicationRecord
  has_many :stories, dependent: :destroy
end
