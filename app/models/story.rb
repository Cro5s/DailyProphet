class Story < ApplicationRecord
  validates :title, :body, :author_id, presence: true
  validates :title, length: { maximum: 255 }
  validates :title, uniqueness: true

  belongs_to :author,
             primary_key: :id,
             foreign_key: :author_id,
             class_name: 'User',
             inverse_of: :stories

  has_many :responses,
           primary_key: :id,
           foreign_key: :story_id,
           class_name: 'Response',
           inverse_of: :story
end
