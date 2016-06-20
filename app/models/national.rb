class National < ApplicationRecord
  #############################################################################
  # Data  model relationships
  #############################################################################
  
  belongs_to :retailer
  has_many :regionals

  #############################################################################
  # Controls on set data`
  #############################################################################
  
  validates :code,
            presence:true,
            uniqueness: true

  validates :label,
            presence:true,
            length: {maximum: 50}

  validates :retailer_id,
            presence:true

  #############################################################################
  # Data mangement before validation `
  #
  #############################################################################
  

  # Rq-national-003 : Before creating or updating national Info set label in the 
  # right format : not space before / first letter capitalize
  before_validation :format_label

  # Rq-national-002 : Before creating or updating national Info generate the code 
  # according the label set.
  before_validation :set_code

  
  #############################################################################
  # Scope on set data`
  #############################################################################

  # Scope on the active nationals
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

  # Rq-national-001: Generating the central national code
  def set_code
      self.code = self.retailer.code+"-nat-"+self.label.strip.upcase[0..2]
  end
  
end
