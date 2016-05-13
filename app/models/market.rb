class Market < ApplicationRecord
  #############################################################################
  # Data  model relationships
  #############################################################################

  # Allowing the attachement of a photo to a category
  has_attachment :photo

  belongs_to :category

  #############################################################################
  # Controls on set data`
  #############################################################################
  validates :code,
            presence:true,
            uniqueness: true

  validates :label,
            presence:true,
            length: {maximum: 50}

  validates :category_id,
            presence:true

  #############################################################################
  # Scope on set data`
  #############################################################################

  # Scope on the active categories
  scope :active, -> {
    where(:active => true)
  }

end
