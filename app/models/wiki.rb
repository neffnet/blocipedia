class Wiki < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_and_belongs_to_many :users

  validates :title, presence: true
  validates :body, presence: true, length: {minimum: 10}
  validates_uniqueness_of :title, scope: :user_id, case_sensitive: false

  after_initialize :init, unless: :persisted?

  scope :recent, ->(num) { order('updated_at DESC').limit(num) }


  def private?
    self.private
  end

  def init
    self.private ||= false
  end
end
