class Response < ApplicationRecord
  validates :body, :author_id, :story_id, presence: true

  belongs_to :author,
             primary_key: :id,
             foreign_key: :author_id,
             class_name: 'User',
             inverse_of: :responses

  belongs_to :story,
             primary_key: :id,
             foreign_key: :story_id,
             class_name: 'Story',
             inverse_of: :responses
end
