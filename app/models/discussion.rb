class Discussion < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  acts_as_votable

  accepts_nested_attributes_for :comments, allow_destroy: true,
    reject_if: [:body].blank?

  scope :ordered_by_creation, -> { order("created_at DESC")}

  include Tire::Model::Search
  include Tire::Model::Callbacks
  
  def to_indexed_json
    # to_json( include: [:title, :body] )#######CHECK This.
    to_json :except => ['updated_at', 'created_at']
  end

end
