class Note < ApplicationRecord
  belongs_to :user
  has_many :notetags, dependent: :destroy
  has_many :tags, through: :notetags
end
