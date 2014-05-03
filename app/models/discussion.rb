class Discussion < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :votes, as: :votable

  include Tire::Model::Search
  include Tire::Model::Callbacks
  
  def to_indexed_json
    # to_json( include: [:title, :body] )#######CHECK This.
    to_json :except => ['updated_at', 'created_at']
  end

end
