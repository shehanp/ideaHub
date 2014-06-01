class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :idea

  validates :user, uniqueness: {scope: :idea_id}
end
