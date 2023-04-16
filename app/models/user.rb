class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
   #confirmable -> 確認mail認證
   devise :database_authenticatable, :registerable,
   :recoverable, :rememberable, :validatable,
   :omniauthable, omniauth_providers: [:google_oauth2, :line, :facebook]
   

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    if auth.provider == "google_oauth2"
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name =auth.info.name
      user.avatar_url = auth.info.image
    elsif auth.provider == "line"
      user.password = Devise.friendly_token[0,20]
      user.name =auth.info.name
      user.avatar_url = auth.info.image
    elsif auth.provider == "facebook"
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name =auth.info.name
      user.avatar_url = auth.info.image
      end
    end
  end

  def email_required?
    false
  end

  def password_required?
    false
  end

end
