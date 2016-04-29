class Category < ApplicationRecord

  #############################################################################
  # Data  model relationships
  #############################################################################

  # Allowing the attachement of a photo to a category
  has_attachment :photo

  belongs_to :country
  has_many :users

  #############################################################################
  # Controls on set data`
  #############################################################################
  validates :code,
            presence:true,
            uniqueness: true

  validates :label,
            presence:true,
            length: {maximum: 50}

  validates :country_id,
            presence:true

  #############################################################################
  # Scope on set data`
  #############################################################################

  # Scope on the active categories
  scope :active, -> {
    where(:active => true)
  }
end
