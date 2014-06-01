class Comment < ActiveRecord::Base
  belongs_to :discussion
  belongs_to :user
  belongs_to :idea
  validates :body, presence: true, length: {minimum: 3}
  acts_as_votable
  scope :ordered_by_creation, -> { order("created_at DESC")}
  
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
