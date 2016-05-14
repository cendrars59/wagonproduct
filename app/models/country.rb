class Country < ApplicationRecord

  #############################################################################
  # Data  model relationships
  #############################################################################
  has_attachment :photo

  belongs_to :country
  has_many :countries


  has_many :categories
  has_many :retailers

  #############################################################################
  # Controls before data records`
  #
  #############################################################################
  validates :code,
            presence: true,
            uniqueness: true,
            length: {maximum: 3}

  validates :label,
            presence: true,
            length: {maximum: 40}


  validates_associated :countries

  #############################################################################
  # Scope on set data`
  #############################################################################

  # Scope on the active countries
  scope :active, -> {
    where(:active => true)
  }

  scope :master, -> {
    where("active = ? and master = ?", true,true )
  }

  scope :notMasterAndActive, -> {
    where("active = ? and master = ?", true, false)
  }


end
