class User < ApplicationRecord
  include Gravtastic
  gravtastic

  ROLES = %w[ admin regular ]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :timeoutable

  alias_method :authenticate, :valid_password?
  
  validates :username, presence: true, uniqueness: { case_sensitive: false }

  has_many :events, dependent: :destroy
  has_many :event_instances, through: :events
  has_many :attendances, dependent: :destroy
  has_many :invitations, dependent: :destroy
  has_many :attachments, dependent: :destroy
  has_many :forum_threads, dependent: :destroy
  has_many :comments, dependent: :destroy

  def is?(role)
    roles.include?(role.to_s)
  end

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def self.from_token_payload payload
    self.find payload["sub"]
  end
end
