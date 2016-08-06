class TeeBoxType < ActiveRecord::Base

  include FrescaModules::ClassLevelInheritableAttributes

  inheritable_attributes :mens, :ladies
  @mens='MENS'
  @ladies='LADIES'

  validates :tee_box_type, presence: true

  has_many :tee_boxes, :dependent => :destroy

end
