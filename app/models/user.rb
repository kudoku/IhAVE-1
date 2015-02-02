class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :locations, dependent: :destroy
  has_many :items, through: :locations, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:google_oauth2]

  validates :username, presence: true, length: { in: 6..15 }, uniqueness: true

  #Get the picture from a given url.
  def avatar_from_url(url)
    self.avatar = open(url)
  end

  # google auth
  def self.from_omniauth(auth)
    where("email = ? OR provider = ? AND uid = ? ", auth.info.email, auth.provider, auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.name   # assuming the user model has a name
      # user.avatar_file_name = URI.parse(auth.info.image) # assuming the user model has an image
      user.avatar_from_url(auth.info.image) # assuming the user model has an image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.google_data"] && session["devise.google_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
