class Wiki < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true, length: {minimum: 10}
  validates_uniqueness_of :title, scope: :user_id, case_sensitive: false

  after_initialize :init, unless: :persisted?

  def private?
    wiki.private
  end

  def init
    self.private ||= false
  end
end
