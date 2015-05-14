class Wiki < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true, length: {minimum: 10}
  validates_uniqueness_of :title, scope: :user_id
end
