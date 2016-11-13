class Course < ActiveRecord::Base

	validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
	validates :zip, presence: true

  has_many :tee_boxes, :dependent => :destroy
  has_many :rounds, :dependent => :destroy

  def name_and_number_of_holes
    combo = self.name + " (" + self.number_of_holes.to_s + " holes)"
  end

end