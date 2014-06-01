class Profile < ActiveRecord::Base
  belongs_to :user

  
  VALID_URL_REGEX   = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix


  validates :first_name, :presence => true, length: {minimum: 1}
  validates :last_name,  :presence => true, length: {minimum: 1}  
  #validates :twitter,    :format => { with: VALID_URL_REGEX, :multiline => true}
  #validates :linkedin,   :format => { with: VALID_URL_REGEX, :multiline => true}

  def full_name
    if first_name || last_name
      "#{first_name} #{last_name}".squeeze(" ").strip
    end
  end
end
