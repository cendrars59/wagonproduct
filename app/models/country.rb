class Country < ApplicationRecord

  #############################################################################
  # Data  model relationships
  #############################################################################

  # Allowing the attachement of a photo to a category
  has_attachment :photo

  has_many :categories

  #############################################################################
  # Controls on set data`
  #############################################################################
  validates :code,
            presence: true,
            uniqueness: true

  validates :label,
            presence: true,
            length: {maximum: 50}

  #############################################################################
  # Scope on set data`
  #############################################################################

    # Scope on the active countries
  scope :active, -> {
    where(:active => true)
  }

end
