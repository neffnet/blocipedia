class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :wikis, dependent: :destroy

  validates_uniqueness_of :name
  after_initialize :init, unless: :persisted?

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
