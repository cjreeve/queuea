class User < ActiveRecord::Base
   # Include default devise modules. Others available are:
   # :token_authenticatable, :confirmable,
   # :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :trackable, 
	       :validatable, :authentication_keys => [:login]

	# Setup accessible (or protected) attributes for your model
	attr_accessible :email, :password, :password_confirmation, :remember_me, :username
	# attr_accessible :title, :body

	attr_accessor :login
	attr_accessible :login

	validates_uniqueness_of :username, case_sensitive: false


    def self.find_first_by_auth_conditions(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        where(conditions).first
      end
    end

    def to_param
    	username
    end

end
