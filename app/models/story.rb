class Story < ApplicationRecord
  belongs_to :sprint, foreign_key: 'sprint_id'

end
