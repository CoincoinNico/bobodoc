class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]
  has_many :drugstore_comments
  has_many :medicament_comments

  def self.find_for_facebook_oauth(auth)
    existing_user = where(auth.slice(:provider, :uid)).first
    return existing_user unless existing_user.nil?

    existing_user = where(email: auth.info.email).first
    if existing_user
      existing_user.provider = auth.provider
      existing_user.uid = auth.uid
      existing_user.picture_url = auth.info.image
      existing_user.save
    else
      existing_user = create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.user_name = auth.info.name   # assuming the user model has a name
        user.picture_url = auth.info.image # assuming the user model has an image
      end
    end
    existing_user
  end
end
