class Idea < ActiveRecord::Base
  acts_as_taggable

  
  belongs_to :user

  has_many :discussions, dependent: :destroy
  has_many :comments, through: :discussions
  has_many :favourites
  has_many :favourited_users, through: :favourites, source: :user
  has_many :votes, as: :votable

  scope :ordered_by_creation, -> { order("created_at ASC")}

  ###########################
  ###########################
  include Tire::Model::Search
  include Tire::Model::Callbacks
  mapping do
  indexes :id, type: :integer
  indexes :title, type: :string
  indexes :body, type: :text
  indexes :user, type: :string
  indexes :tag, type: :string
  end
  

  def to_indexed_json
    # to_json( include: [:title, :body] )#######CHECK This.
    to_json :except => ['updated_at', 'created_at']
  end

  def self.search(params)
    tire.search(load: true) do
      query { string params[:query] } if params[:query].present?
    end   
  end
  ###########################
  ###########################
  


end