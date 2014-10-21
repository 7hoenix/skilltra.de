class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable
 
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable
       # :validatable,
 
         has_many :posts, dependent: :destroy
         has_one :account, dependent: :destroy
         has_many :jobs, dependent: :destroy
         has_many :bids, dependent: :destroy
          has_many :reviews


  # def self.set_average_score(score)
  #   user.average_score = user.average_score + score.score
  # end







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

#linked in omni auth
    def self.connect_to_linkedin(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else

        user = User.create(name: auth.info.first_name,
                            provider: auth.provider,
                            uid: auth.uid,
                            email: auth.info.email,
                           image: auth.info.image,
                            password: Devise.friendly_token[0,20],
                          )
      end

    end
  end   
end