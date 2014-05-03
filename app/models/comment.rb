class Comment < ActiveRecord::Base
  belongs_to :discussion
  belongs_to :user
  has_many :votes, as: :votable
  validates :body, presence: true, length: {minimum: 3}

  include Tire::Model::Search
  include Tire::Model::Callbacks

def to_indexed_json
  # to_json( include: [:title, :body] )#######CHECK This.
  to_json :except => ['updated_at', 'created_at']
end


def cleaner
  self.body.squeeze!(" ").strip!
end 

def capitalizer
  self.body.capitalize!
end


end
