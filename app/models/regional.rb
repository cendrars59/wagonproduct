class Regional < ApplicationRecord

  #############################################################################
  # Data  model relationships
  #############################################################################

  belongs_to :national

  #############################################################################
  # Data mangement before validation `
  #
  #############################################################################
  

  # Rq-regional-003 : Before creating or updating regional Info set label in the 
  # right format : not space before / first letter capitalize
  before_validation :format_label

  # Rq-regional-002 : Before creating or updating regional Info generate the code 
  # according the label set.
  before_validation :set_code




  #############################################################################
  # Controls on set data`
  #############################################################################
  validates :code,
            presence:true,
            uniqueness: true

  validates :label,
            presence:true,
            length: {maximum: 50}

  validates :national_id,
            presence:true

  #############################################################################
  # Scope on set data`
  #############################################################################

  # Scope on the active markets
  scope :active, -> {
    where(:active => true)
  }

  scope :search, -> (query){
    where("code like :query or label like :query", query: "%#{query}%")
  }

  private

  def format_label
    self.label = self.label.strip.capitalize
  end 

  # Rq-regional-001: Generating the market code
  def set_code
      self.code = self.national.code+"-"+self.label.strip.upcase[0..2]
  end
end
