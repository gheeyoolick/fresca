class TeeBox < ActiveRecord::Base

  include FrescaModules::ClassLevelInheritableAttributes

  inheritable_attributes :colors
  @colors=['BOOMBOOM', 'TIPS', 'BLUE','WHITE','RED','GOLD','BLACK','GREEN','ORANGE','COPPER', 'SILVER']

  validates :color, presence: true

  default_scope { order(:total_yardage_dirty => :desc)}

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

  def total_par_mens
    if self.holes.count != 0
      tpm = 0
      self.holes.each do |hole|
        tpm+=hole.par_mens
      end
      tpm
    else
      0
    end
  end

  def total_par_ladies
    if self.holes.count != 0
      tpl = 0
      self.holes.each do |hole|
        tpl+=hole.par_ladies
      end
      tpl
    else
      0
    end
  end

  def number_of_holes
    self.holes.count
  end


end
