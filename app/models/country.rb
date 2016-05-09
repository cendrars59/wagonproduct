class Country < ApplicationRecord

  #############################################################################
  # Data  model relationships
  #############################################################################

  # Allowing the attachement of a photo to a category
  has_attachment :photo

  # Relathionship with a master country
  belongs_to :country
  has_many :countries

  #categories must be related to a country
  has_many :categories

  #############################################################################
  # Controls before data`
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
  # Method to retrieve the list of data according the search criteria
  #############################################################################

  def self.search(search)
  if search
    find(:all, :conditions => ['label LIKE ?', "%#{search}%"])
  else
    find(:all)
  end



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
    where("active = ? and master = ?", true,false)
  }





end
