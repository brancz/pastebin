class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :confirmable, :lockable, :timeoutable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable, :omniauth_providers => [:github],
    :authentication_keys => [:login]

  validates :name,
    :uniqueness => {
    :case_sensitive => false
  }

    attr_accessor :login

    has_many :pastes

    def self.find_first_by_auth_conditions(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions).where(["lower(name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        where(conditions).first
      end
    end

    def self.find_for_github_oauth2(access_token, signed_in_resource=nil)
      data = access_token.info
      user = User.where(:email => data["email"]).first

      unless user
        user = User.create(name: data["nickname"],
                           email: data["email"],
                           provider: access_token.provider,
                           uid: access_token.uid,
                           password: Devise.friendly_token[0,20]
                          )
      end
      user
    end

    def confirmation_required?
      self.provider.nil?
    end

		def admin?
			admin == true
		end

end
