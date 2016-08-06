class TeeBox < ActiveRecord::Base

  include FrescaModules::ClassLevelInheritableAttributes

  inheritable_attributes :colors
  @colors=['BOOMBOOM', 'TIPS', 'BLUE','WHITE','RED','GOLD','BLACK','GREEN','ORANGE','COPPER', 'SILVER']

  validates :color, presence: true

  default_scope { order(:tee_box_type_id => :asc, :total_yardage_dirty => :desc)}

  has_many :holes, :dependent => :destroy
  accepts_nested_attributes_for :holes
  validates_associated :holes

  belongs_to :course
  belongs_to :tee_box_type

  def total_yardage
    if self.holes.count != 0
      ty = 0
      self.holes.each do |hole|
        ty+=hole.yardage
      end
      ty
    else
      0
    end
  end

  def total_par
    if self.holes.count != 0
      tpm = 0
      self.holes.each do |hole|
        tpm+=hole.par
      end
      tpm
    else
      0
    end
  end

  def number_of_holes
    self.holes.count
  end


end
