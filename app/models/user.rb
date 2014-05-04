class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ############ CARRIERWAVE ############
  mount_uploader :image, ImageUploader
  ############ CARRIERWAVE ############

  has_many :discussions
  has_many :comments
  has_many :vote, as: :votable
  validates :first_name, :presence => true, length: {minimum: 1}
  validates :last_name,  :presence => true, length: {minimum: 1}
  validates :email,      :uniqueness => true


  def full_name
    if first_name || last_name
        "#{first_name} #{last_name}".squeeze(" ").strip
    else
        email
    end
  end


end

