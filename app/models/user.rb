class User < ActiveRecord::Base

  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_URL_REGEX   = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix


  validates :email,      :uniqueness => true, :presence => true, :format => { with: VALID_EMAIL_REGEX }
  validates :first_name, :presence => true, length: {minimum: 1}
  validates :last_name,  :presence => true, length: {minimum: 1}  
  validates :twitter,    :format => { with: VALID_URL_REGEX, :multiline => true}
  validates :linkedin,   :format => { with: VALID_URL_REGEX, :multiline => true}
  has_many :comments
  has_many :vote, as: :votable


  ############ CARRIERWAVE ############
  mount_uploader :image, ImageUploader
  ############ CARRIERWAVE ############  


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


end

