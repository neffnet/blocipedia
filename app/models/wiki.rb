class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :contributions
  has_many :contributors, :through => :contributions, :source => :user

  validates :title, presence: true
  validates :body, presence: true, length: {minimum: 10}
  validates_uniqueness_of :title, scope: :user_id, case_sensitive: false

  after_initialize :init, unless: :persisted?

  scope :recent, ->(num) { order('updated_at DESC').where("private = ?", false).limit(num) }


  def private?
    self.private
  end

  def init
    self.private ||= false
  end
end
