class Idea < ActiveRecord::Base
  acts_as_taggable
  acts_as_votable
  
  belongs_to :user

  has_many :discussions, dependent: :destroy
  has_many :comments, through: :discussions
  


  scope :ordered_by_creation, -> { order("created_at DESC")}

  ############ CARRIERWAVE ############
  mount_uploader :image, ImageUploader
  ############ CARRIERWAVE ############  

  ###########################
  ###########################

  include Tire::Model::Search
  include Tire::Model::Callbacks

  #rake environment tire:import CLASS=Article FORCE=true

  mapping do
    indexes :id, type: :integer
    indexes :title, type: :string
    indexes :body, type: :string, :analyzer => 'snowball'
    indexes :user, type: :string
    indexes :tags do
      indexes :name, analyzer: 'snowball'
    end
  end

  def to_indexed_json
    to_json :except => ['updated_at'], methods: :tags
  end

  def self.search(params)
    tire.search(page: params[:page], per_page: 2) do
      query { string "#{params[:query]}", default_operator: "AND", analyze_wildcard: false} if params[:query].present?
      sort { by :created_at, "desc" } if params[:query].blank?
    end   
  end
  ###########################
  ###########################
  

  def self.highest_voted
    self.order("cached_votes_score DESC")
  end
 

end