class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :wikis, dependent: :destroy

  validates_uniqueness_of :name
  after_initialize :init, unless: :persisted?

  scope :recent, -> (num) { order('last_sign_in_at DESC').limit(num) }
  #TODO: need to add something like ` .where(user.wikis.length > 0) `

  def admin?
    role == 'admin'
  end

  def premium?
    role == 'premium'
  end

  def standard?
    role = 'standard'
  end

  def init
    self.role ||= 'standard'
  end

end
