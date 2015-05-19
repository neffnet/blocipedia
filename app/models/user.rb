class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :wikis
  has_many :contributions
  has_many :contributing_wikis, :through => :contributions, :source => :wiki

  validates_uniqueness_of :name
  after_initialize :init, unless: :persisted?

  def self.recent_with_wikis(num)
    where('EXISTS(SELECT 1 FROM wikis WHERE user_id = users.id)').order('last_sign_in_at DESC').limit(num)
  end

  def admin?
    role == 'admin'
  end

  def premium?
    role == 'premium'
  end

  def standard?
    role == 'standard'
  end

  def init
    self.role ||= 'standard'
  end

end
