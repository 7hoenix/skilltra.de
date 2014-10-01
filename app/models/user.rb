class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :omniauth_providers => [:facebook]
 
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable
       # :validatable,
 
         has_many :posts, dependent: :destroy
         has_one :account, dependent: :destroy
         has_one :credit
         has_many :jobs, dependent: :destroy
         has_many :bids, dependent: :destroy


 
 # This is for omniauth 
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
    
    end
  end


  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
            
        end
      end
    end
 end
