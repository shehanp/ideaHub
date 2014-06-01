class User < ActiveRecord::Base

  has_secure_password
  acts_as_voter

  has_one :profile
  accepts_nested_attributes_for :profile
  delegate :full_name, to: :profile

  has_many :memberships, dependent: :destroy
    #user.memberships
  has_many :member_projects, through: :memberships, source: :project

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i


  validates :email, :format => { with: VALID_EMAIL_REGEX }, :uniqueness => true, :presence => true 


  has_many :comments


  ############ CARRIERWAVE ############
  mount_uploader :image, ImageUploader
  ############ CARRIERWAVE ############  
 
  before_create { generate_token(:auth_token) }

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def full_name
    if first_name || last_name
        "#{first_name} #{last_name}".squeeze(" ").strip
    else
        email
    end
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

#, :format => { with: VALID_EMAIL_REGEX }

end

